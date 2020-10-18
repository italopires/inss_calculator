class InssCalculator
  def initialize(salary)
    @salary = salary
  end

  def self.calculate(salary)
    new(salary).calculate
  end

  def calculate
    return 0 if @salary.blank?
    value = 0
    if @salary <= 1045
      value = @salary * 0.075
    elsif @salary <= 2089.6
      value = (@salary - 1045) * 0.09
    elsif @salary <= 3134.4
      value = (@salary - 2089.6) * 0.12
    elsif @salary <= 6101.06
      value = (@salary - 3134.4) * 0.14
    else
      value = 0
    end
    value.to_d.truncate(2).to_f
  end
end