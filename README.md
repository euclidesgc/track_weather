# Weather App README

This application was developed to provide current weather information and detailed forecasts based on OpenWeatherMap API data. Here's an overview of the project and how you can explore it.

## Objective

The main objective of the Weather App is to provide users with detailed weather information, including current data and forecasts, for different locations. Using OpenWeatherMap API data, the app allows users to track weather conditions in various parts of the world.

## Project Structure

The Weather App follows an organized structure to better separate responsibilities and components. Here are the main directories and files:

- **`lib/weather`**: Contains core weather-related components.
  - **`respositories`**: Responsible for interacting with external data sources.
  - **`data`**: Handles external data access through an API.
  - **`domain`**: Defines use cases and main domain entities.
  - **`presentation`**: Handles user interface and display of weather data.
    - **`current_weather`**: Pages and controllers for displaying current weather information.
    - **`forecast_weather`**: Pages and controllers for displaying weather forecasts.
    - **`widgets`**: Contains reusable widgets for displaying weather information.

## Main Components

- **`lib/main.dart`**: Entry point of the application, where environment variables are configured.
- **`lib/weather/presentation/current_weather/current_weather_page.dart`**: Page for displaying current weather information, filtering, and adding new locations.
- **`lib/weather/presentation/forecast_weather/forecast_weather_page.dart`**: Page for viewing future weather forecasts for a selected location.
- **`lib/weather/presentation/widgets/weather_tile.dart`**: A reusable widget to display weather information on both pages.

## Running the Project

To run the Weather App:

1. Make sure the `BASE_URL` and `API_KEY` environment variables are correctly configured in `lib/main.dart`.
   Example:
   - `BASE_URL = https://api.openweathermap.org/data/2.5/`
   - `API_KEY = xxxxxbb6b966zzzzz365500a541yyyyy`

2. You can create a free account and obtain your API key from: [https://home.openweathermap.org/users/sign_up](https://home.openweathermap.org/users/sign_up)

3. Run the app with Flutter on an emulator or physical device.

4. Explore the different pages to view current weather information and detailed forecasts.

## Filtering the Location List

The Weather App allows you to filter the list of locations based on name and country. Follow these steps to perform a filter:

1. On the main app screen, you'll see text fields labeled as "Name" and "Country."

2. Type at least three letters in the "Name" field to start filtering the location list by name.

3. Fill in the "Country" field with two uppercase letters to filter by country.

4. The app uses a debounce mechanism to wait a short period after you stop typing. This improves efficiency and prevents excessive filtering.

5. The list of locations will update with results that match the filter.

## Adding New Locations

The Weather App allows you to add new locations to the monitored locations list. Follow these steps to add a new location:

1. On the main app screen, fill in the "Name" and "Country" fields with information about the new location you want to add.

2. Tap the plus icon (+) next to the input fields.

3. The app will attempt to add the new location to the list after verifying the entered details.

4. If the addition is successful, the list of locations will update with the new entry.

5. If an error occurs during the process, an error message will be displayed, explaining the issue.

## Contact

euclides.catunda@gmail.com

https://www.linkedin.com/in/euclidesgc/


---

# Weather App README (Pt_BR)

Este aplicativo foi desenvolvido para fornecer informações climáticas atuais e previsões detalhadas com base nos dados da API OpenWeatherMap. Aqui está um resumo do projeto e como você pode explorá-lo.

## Objetivo

O objetivo principal do Weather App é oferecer aos usuários informações detalhadas sobre o clima, incluindo dados atuais e previsões, para diferentes localizações. Com base nos dados da API OpenWeatherMap, o aplicativo permite que os usuários acompanhem as condições climáticas em várias partes do mundo.

## Estrutura do Projeto

O Weather App segue uma estrutura organizada para melhor separar as responsabilidades e componentes. Aqui estão os principais diretórios e arquivos:

- **`lib/weather`**: Contém os componentes principais relacionados ao clima.
  - **`respositories`**: Responsável por interagir com fontes externas de dados.
  - **`data`**: Realiza acesso externo aos dados providos através de uma API.
  - **`domain`**: Define os casos de uso e as entidades principais do domínio.
  - **`presentation`**: Trata da interface do usuário e da exibição dos dados climáticos.
    - **`current_weather`**: Páginas e controladores para exibição de informações climáticas atuais.
    - **`forecast_weather`**: Páginas e controladores para exibição de previsões climáticas.
    - **`widgets`**: Contém widgets reutilizáveis para exibição de informações climáticas.

## Principais Componentes

- **`lib/main.dart`**: Ponto de entrada do aplicativo, onde as variáveis de ambiente são configuradas.
- **`lib/weather/presentation/current_weather/current_weather_page.dart`**: Página para exibição das informações climáticas atuais, filtragem e adição de novas localizações.
- **`lib/weather/presentation/forecast_weather/forecast_weather_page.dart`**: Página para visualização de previsões climáticas futuras para uma localização selecionada.
- **`lib/weather/presentation/widgets/weather_tile.dart`**: Um widget reutilizável para mostrar informações climáticas em ambas as páginas.

## Executando o Projeto

Para executar o Weather App:

1. Certifique-se de que as variáveis de ambiente `BASE_URL` e `API_KEY` estão configuradas corretamente em `lib/main.dart`.
   Exemplo:
   - `BASE_URL = https://api.openweathermap.org/data/2.5/`
   - `API_KEY = xxxxxbb6b966zzzzz365500a541yyyyy`

2. Você pode criar uma conta gratuita e obter sua chave de API em: [https://home.openweathermap.org/users/sign_up](https://home.openweathermap.org/users/sign_up)

3. Execute o aplicativo com o Flutter em um emulador ou dispositivo físico.

4. Explore as diferentes páginas para visualizar informações climáticas atuais e previsões detalhadas.

## Filtrando a Lista de Localidades

O Weather App permite que você filtre a lista de localidades com base no nome e país. Siga estas etapas para realizar um filtro:

1. Na tela principal do aplicativo, você verá um campo de texto rotulado como "Nome" e outro como "País".

2. Digite pelo menos três letras no campo "Nome" para começar a filtrar a lista de localidades por nome.

3. Preencha o campo "País" com duas letras maiúsculas para filtrar por país.

4. O aplicativo utiliza um mecanismo de aguardo (debounce) para aguardar um curto período após você parar de digitar. Isso melhora a eficiência e evita filtragens excessivas.

5. A lista de localidades será atualizada com os resultados correspondentes ao filtro.

## Adicionando Novas Localidades

O Weather App permite que você adicione novas localidades à lista de localidades monitoradas. Siga estas etapas para adicionar uma nova localidade:

1. Na tela principal do aplicativo, preencha os campos "Nome" e "País" com informações da nova localidade que deseja adicionar.

2. Toque no ícone de adição (ícone de +) próximo aos campos de entrada.

3. O aplicativo tentará adicionar a nova localidade à lista após verificar os detalhes inseridos.

4. Se a adição for bem-sucedida, a lista de localidades será atualizada com a nova entrada.

5. Caso ocorra algum erro durante o processo, uma mensagem de erro será exibida, informando o motivo do problema.

## Contato

euclides.catunda@gmail.com

https://www.linkedin.com/in/euclidesgc/

---

