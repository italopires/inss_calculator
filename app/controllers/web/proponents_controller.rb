class Web::ProponentsController < Web::BaseController
  private

  def permitted_params
    params.require(:proponent).permit(:name, :cpf, :birthdate, :public_place, :address_number, :neighborhood,
      :cep, :personal_phone, :reference_phone, :salary)
  end

  def after_save_path
    proponents_path
  end
end