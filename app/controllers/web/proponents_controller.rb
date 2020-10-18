class Web::ProponentsController < Web::BaseController
  before_action :set_states, only: [:new, :create, :edit, :update]
  before_action :set_cities, only: [:new, :create, :edit, :update]

  def create
    @object = object_class.new permitted_params
    @object.inss_discount = InssCalculator.calculate(@object.salary)

    if @object.save
      redirect_to after_save_path, notice: t('notices.created', model: object_class.model_name.human)
    else
      render :new
    end
  end

  def update
    @object = object_class.find params[:id]
    inss_discount = InssCalculator.calculate(permitted_params[:salary].to_f)

    if @object.update(permitted_params.merge(inss_discount: inss_discount))
      redirect_to after_save_path, notice: t('notices.updated', model: object_class.model_name.human)
    else
      render :edit
    end
  end

  private

  def permitted_params
    params.require(:proponent).permit(:name, :cpf, :birthdate, :public_place, :address_number, :neighborhood,
      :cep, :personal_phone, :reference_phone, :salary, :inss_discount, :city_id, :state_id)
  end

  def after_save_path
    proponents_path
  end

  def set_states
    @states = State.order(:name)
  end

  def set_cities
    @cities = City.order(:name)
  end
end