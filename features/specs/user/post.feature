#language :pt

Funcionalidade: Cadastrar Usuário
    Sendo uma aplicação que recebeu dados do Usuário
    Posso solicitar uma requisição do tipo POST
    Para que os dados deste usuário sejam de fato cadastrados no sistema

    @post_200
    Cenário: Cadastro Simplificado

        Dado que o usuário informou os seguintes dados:
            | name     | Maria           |
            | email    | maria@teste.com |
            | password | 123456          |
        Quando eu faço uma solicitação POST para o serviço user
        Então o código de resposta HTTP deve ser igual "200"
        E no corpo da resposta deve conter o ID do usuário


    Esquema do Cenário: Campos não enviados

        Dado que o usuário informou os seguintes dados:
            | name     | <name>     |
            | email    | <email>    |
            | password | <password> |
        Quando eu faço uma solicitação POST para o serviço user
        Então o código de resposta HTTP deve ser igual "<status_code>"
        E no corpo da resposta deve ver uma mensagem "<message>"

        Exemplos:
        | name  | email           | password | status_code | message               |
        |       | maria@teste.com | 123456   | 409         | Name is required.     |
        | Maria |                 | 123456   | 409maria    | Email is required.    |
        | Maria | maria@teste.com |          | 409         | Password is required. |