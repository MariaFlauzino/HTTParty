#language: pt
@post_task
Funcionalidade: Cadastrar tarefas
    Sendo uma aplicação cliente
    Posso solicitar requisições POST para o serviço tasks
    Para que as tarefas do usuário sejam cadastradas no sistema

    Contexto: Autenticação
        Dado que o usuário está autenticado
            | email    | maria@teste.com|
            | password | 123456         |

    Cenário: Nova tarefa
        E o usuário informou a seguinte tarefa  
            | titulo | Ler um livro de javscript |
            | data   | 31/03/2018                |
        E o usuário tagueou esta tarefa com:
            | tag        |
            | javascript |
            | livro      |
            | leitura    |
            | estudar    |
        Quando eu faço uma solicitação POST para o serviço tasks
        Então o código de resposta HTTP deve ser igual "401"
        E esta tarefa dever ser cadastrada com sucesso
