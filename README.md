Esse é um projeto de uma plataforma de oferta e busca de freelance.<br>
Ele compõe a etapa de projetos do Treinadev-7, oferecido pela Campus Code.<br>
O código empregado foi o Ruby 2.7.0. <br>
    No desenvolvimento do back-end foram utilizadas as Gems do Ruby on Rails,<br>
descritas no arquivo Gemfile. Para instalar as dependências basta rodar:
```
bundle install<br>
```
Para o front-end foi utilizado o bootstrap. Para instala-lo, basta fazer:
```
yarn add bootstrap<br>
```


    A plataforma, chamada easylancer, possui o acesso de dois tipos de usuário:
- Contratador (employer)
- Freelancer (freelancer)

    Para utilizar a plataforma é necessário estar logado. Além disso, o freelancer<br>
precisa possuir um perfil completo para poder ter acesso e e enviar propostas<br>
para os projetos oferecidos pelos contratadores.<br>

    O contratador consegue cadastrar os projetos,que por padrão são criadas pendentes. <br>
    O contratador também visualiza as propostas dos freelancers e então <br>
aceita elas ou não.<br>
    O freelancer precisa cadastrar um perfil para ter acesso aos projetos que <br>
estão em aberto e fazer propostas.<br>

    As áreas profissionais compõe o perfil e devem ser inseridas no preenchimento  <br>
do perfil dos freelancers e compor um projeto.

--------------------Dados exemplos cadastrados ---------------------------------------<br>
    O plataforma possui alguns dados de usuários e projetos exemplos, descritos <br>
no arquivo db/seed. Para aplicar esse banco de dados exemplo basta usar o comando:<br>
```
rails db:seed <br>
```

    Nesse arquivo estão inseridos:
Dados exemplos de áreas profissionais:
- Cozinha
- Piloto
- Desenvolvedor
- Designer
- UX
- Administrador de banco de dados

    Dados exemplo de contratador:
- Sirigueijo: siri@burguer.br / senha 123456789
Esse usuário possui um projeto, com título Vaga de cozinheiro no Sirigueijo Burguer.


Dados exemplos de freelancers:
- Bob esponja: bob@sponj.com.br / senha 123456789
- Julio César: julio@max.com.br / senha 123456789
- Chewbaca: chew@yfrr.com.br / senha 123456789

Esses três freelancers apresentaram propostas para o projeto do Sirigueijo,mas apenas <br>
a proposta de Bob esponja foi aceita.






