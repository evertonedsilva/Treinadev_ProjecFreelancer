
Area.create!(name: 'Carisma')

sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
cargo1= Project.create!(title:'Atendente',employer:sirigueijo )
cargo1.closed!
cargo2 =Project.create!(title:'Cozinheiro',employer:sirigueijo )
