puts '|- States....'
[
    { name: "Pará" },
    { name: "Paraíba" },
    { name: "Pernambuco" },
    { name: "Piauí" },
    { name: "Paraná" },
    { name: "Rio de Janeiro" }
].each do |item|
  State.create!(name: item[:name])
end

puts '|- Cities....'
cities = [
    ["Bom Jesus", "Piauí"],
    ["Bom Princípio do Piauí", "Piauí"],
    ["Bonfim do Piauí", "Piauí"],
    ["Boqueirão do Piauí", "Piauí"],
    ["Brasileira", "Piauí"],
    ["Brejo do Piauí", "Piauí"],
    ["Buriti dos Lopes", "Piauí"],
    ["Buriti dos Montes", "Piauí"],
    ["Cabeceiras do Piauí", "Piauí"],
    ["Cajazeiras do Piauí", "Piauí"],
    ["Teresina", "Piauí"],
    ["Nova Esperança do Piriá", "Pará"],
    ["Nova Ipixuna", "Pará"],
    ["Nova Timboteua", "Pará"],
    ["Novo Progresso", "Pará"],
    ["Novo Repartimento", "Pará"],
    ["Óbidos", "Pará"],
    ["Oeiras do Pará", "Pará"],
    ["Oriximiná", "Pará"],
    ["Correntes", "Pernambuco"],
    ["Cortês", "Pernambuco"],
    ["Cumaru", "Pernambuco"],
    ["Cupira", "Pernambuco"],
    ["Custódia", "Pernambuco"],
    ["Dormentes", "Pernambuco"],
    ["Quissamã", "Rio de Janeiro"],
    ["Resende", "Rio de Janeiro"],
    ["Rio Bonito", "Rio de Janeiro"],
    ["Rio Claro", "Rio de Janeiro"],
    ["Rio das Flores", "Rio de Janeiro"],
    ["Rio das Ostras", "Rio de Janeiro"],
    ["Rio de Janeiro", "Rio de Janeiro"],
    ["Bernardino Batista", "Paraíba"],
    ["Boa Ventura", "Paraíba"],
    ["Boa Vista", "Paraíba"],
    ["Bom Jesus", "Paraíba"],
    ["Bom Sucesso", "Paraíba"],
    ["Bonito de Santa Fé", "Paraíba"],
    ["Boqueirão", "Paraíba"],
    ["Balsa Nova", "Paraná"],
    ["Bandeirantes", "Paraná"],
    ["Barbosa Ferraz", "Paraná"],
    ["Barracão", "Paraná"],
    ["Barra do Jacaré", "Paraná"]
]
cities.each do |item|
  City.create!(name: item[0], state: State.find_by(name: item[1]))
end

puts '|- Proponents....'
10.times do
  city = City.find_by(name: cities.sample[0])
  salary = rand(100..3000.0).round(2)
  Proponent.create!(
    name: FFaker::Name.name,
    cpf: FFaker::IdentificationBR.cpf,
    birthdate: FFaker::Time.date,
    public_place: FFaker::Address.secondary_address,
    address_number: FFaker::Address.building_number,
    neighborhood: FFaker::Address.neighborhood,
    cep: FFaker::AddressBR.zip_code,
    personal_phone: FFaker::PhoneNumber.phone_number,
    reference_phone: FFaker::PhoneNumber.phone_number,
    salary: salary,
    inss_discount: InssCalculator.calculate(salary),
    state: city.state,
    city: city
  )
end
