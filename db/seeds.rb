
especialidade = Area.create!(name: 'Carisma')

sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
atendente = Project.create!(title:'Atendente',employer:sirigueijo, 
    title: 'Vaga de cozinheiro no Sirigueijo Burguer',  
    description:'Procuro alguém para preparo de hamburgueres de Siri', 
    value_hour:'500',
    limit_proposal:'10/11/2021',
    start_date:'10/12/2021' ,
    end_date:'10/01/2022' ,
    squad_num: 1,
    adress: 'Fenda do Bikini' ,
    city: 'Atlantida' ,            
    area: especialidade,
    remote: true)

atendente .closed!
cozinheiro = Project.create!(title:'Cozinheiro',employer:sirigueijo, 
    title: 'Vaga de cozinheiro no Sirigueijo Burguer',  
    description:'Procuro alguém para preparo de hamburgueres de Siri', 
    value_hour:'500',
    limit_proposal:'10/11/2021',
    start_date:'10/12/2021' ,
    end_date:'10/01/2022' ,
    squad_num: 1,
    adress: 'Fenda do Bikini' ,
    city: 'Atlantida' ,            
    area: especialidade,
    remote: true)
