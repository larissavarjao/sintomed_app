# sintomed_app

Projeto que visa acompanhamento de sintomas de pessoas acamadas, onde no momento que a pessoa apresentar um sintoma (convulsão, febre, etc) esse sintoma seja adicionado e seja acompanhado o histórico de sintomas do paciente em questão.

## Estrutura do Projeto

A pasta principal `lib`, é organizada:
- `/src`: onde ficam toda a estrutura do projeto
- `main.dart`: arquivo de input inicial do projeto
- `routes.dart`: arquivo para organizar as rotas do projeto

## Arquitetura do Projeto (Pasta Source)

Dentro da pasta `/src`, temos a seguinte estrutura:
- `/models`: pasta onde fica armazenada os models do projeto
- `/repositories`: onde ficam armazenadas as camadas de chamada com ambientes externos, por ex: chamadas de api
- `/services`: onde ficam armazenadas os serviços internos da aplicação, por ex: dio, shared preferences
- `/stores`: onde ficam armezanadas as camadas de controles do estado da aplicação. Nesse caso, como usamos MobX para controlar o estado, acontece por meio das stores.
- `/ui`: pasta onde ficam armazenadas as views da aplicação.
- `utils`: pasta para armazenar utensílios que serão usados reutilizados, tais como constantes de cores, urls da api, etc.

## Organização da UI

A pasta `/ui` é organizada da seguinte forma:
- `/screens`: telas que ocupam uma tela inteira, geralmente sendo uma rota
- `/pages`: páginas internas que não se configuram como uma tela ou que não configuram uma rota, tais como criações de sintomas.
- `/tabs`: telas que fazem parte da appbar ou tabbar.
- `/widgets`: componentes mais simples que incluem somente uma widget ou estrutura simples, tais como botões.


## Como rodar o projeto

Baixe a api de sintomas disponível em [Sintomed-API](https://github.com/larissavarjao/sintomed-api) e siga as intruções. Após isso, abra o seu vs code e selecione o device onde você quer rodar o seu aplicativo e pressione F5. Caso tenha dificuldades, o [site de flutter](https://flutter.dev/docs/get-started/test-drive?tab=vscode) possui instruções bem legais sobre como rodar aplicativos no vs code.