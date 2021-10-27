        cozinha = Area.create!(name: 'Cozinha')  

        piloto = Area.create!(name: 'Piloto') 
   
        sirigueijo = Employer.create!(email: 'siri@burguer.br', password: '123456789')
                 
        cozinheiro = Project.create!( employer:sirigueijo, 
            title: 'Vaga de cozinheiro no Sirigueijo Burguer',  
            description:'Procuro alguém para preparo de hamburgueres de Siri', 
            value_hour:'500',
            limit_proposal:10.days.from_now,
            start_date:1.month.from_now ,
            end_date:3.month.from_now  ,
            squad_num: 1,
            adress: 'Fenda do Bikini' ,
            city: 'Atlantida' ,            
            area: cozinha,
            remote: true)
    

        julio = Freelancer.create!(email: 'julio@max.com.br', password: '123456789')
        profile_julio = LancerInfo.create!(name:'Julio César' , social:'Julinho', birth:'10/12/1005', 
                adress: 'Rua das Pedras num XX' , city:'Roma' , formation: 'Filosofia e Arte da Guerra', 
                description:'Otimo líder e extrategista', 
                experiences: 'Fui general, Imperador e namorei a Cleopatra',
                area: piloto, freelancer: julio )
        proposalJ = Proposal.create!(message:'Cabeças vão rolar se eu nao for escolhido', week_availability: '50', 
                    expected_end:'01/01/2021',claim_hour: '30', project: cozinheiro, freelancer: julio)

        bob = Freelancer.create!(email: 'bob@sponj.com.br', password: '123456789')
        profile_bob = LancerInfo.create!(name:'Bob esponja' , social:'Bob', birth:'10/10/2010', 
                adress: 'Feira do Bikini' , city:'Atlantida' , formation: 'Sim', 
                description:'Entusiasmado', 
                experiences: 'Moro num abacaxi',
                area: cozinha, freelancer: bob )
        proposalB = Proposal.create!(message:'Eu quero tentar', week_availability: '50', 
                    expected_end:'01/01/2021',claim_hour: '30', project: cozinheiro, freelancer: bob)

        chewbaca = Freelancer.create!(email: 'chew@yfrr.com.br', password: '123456789')
        profile_chew = LancerInfo.create!(name:'Chewbaca' , social:'Chewie', birth:'02/06/4756', 
                adress: 'Feira do Bikini' , city:'Atlantida' , formation: 'Sim', 
                description:'Ser intergalático', 
                experiences: 'Guerreiro e copiloto',
                area: piloto, freelancer: chewbaca )
        proposalC = Proposal.create!(message:'Sou o mais indicado', week_availability: '250', 
                expected_end:'01/06/4780', claim_hour: '30000', project: cozinheiro, freelancer: chewbaca)
        
        
        proposalB.accepted!
        
