# Rick and Morty API

Esta API retorna o Nome e a Data em que um personagem da série Rick and Morty foi ao ar pela primeira vez. Basta apenas informar o ID de um personagem e Wubba Lubba Dub Dub!

Como rodar este projeto:

* Clonar o projeto

* Executar o ```bundle install```

* Executar ```rails s```

* No browser fazer a requisição GET, passando o id do personagem: ```localhost:3000/api/v1/characters/(id do personagem)```

Para rodar os testes:

* Execute ```rspec spec/requests/get_character_air_date_spec.rb:5``` para visualizar o cenário de sucesso

* Execute ```rspec spec/requests/get_character_air_date_spec.rb:16``` para visualizar o cenário de erro 404

* Execute ```rspec spec/requests/get_character_air_date_spec.rb:26``` para visualizar o cenário de erro 500