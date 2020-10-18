class Api::V1::InssCalculatorsController < ApplicationController
  def calculate
    inss_calculation = InssCalculator.calculate(params[:salary].to_f)

    respond_to do |format|
      format.json { render json: { inss_value: inss_calculation }, status: :ok }
    end
  end
end