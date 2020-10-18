puts '|- States....'
[
    { name: "Acre" },
    { name: "Alagoas" },
    { name: "Amazonas" },
    { name: "Amapá" },
    { name: "Bahia" },
    { name: "Ceará" },
    { name: "Distrito Federal" },
    { name: "Espírito Santo" },
    { name: "Goiás" },
    { name: "Maranhão" },
    { name: "Minas Gerais" },
    { name: "Mato Grosso do Sul" },
    { name: "Mato Grosso" },
    { name: "Pará" },
    { name: "Paraíba" },
    { name: "Pernambuco" },
    { name: "Piauí" },
    { name: "Paraná" },
    { name: "Rio de Janeiro" },
    { name: "Rio Grande do Norte" },
    { name: "Rondônia" },
    { name: "Roraima" },
    { name: "Rio Grande do Sul" },
    { name: "Santa Catarina" },
    { name: "Sergipe" },
    { name: "São Paulo" },
    { name: "Tocantins" }
].each do |item|
  State.create!( name: item[:name])
end