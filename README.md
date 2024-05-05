# PokeTok

PokeTok is a Flutter application that allows you to discover and save your favorite Pokémon in a TikTok-style interface. It utilizes data from the [PokeAPI](https://pokeapi.co/api/v2/) to provide comprehensive information about Pokémon species.

Available debug version v1.0.0: https://github.com/manununhez/pokemon_flutter/releases/tag/v1.0.0

## Overview

PokeTok provides a fun and engaging way to explore the vast world of Pokémon. With its intuitive user interface inspired by TikTok, you can effortlessly swipe through Pokémon profiles, view their details, and mark your favorites.

## Screenshot
| ![Screenshot 1](https://github-production-user-asset-6210df.s3.amazonaws.com/5048531/327983068-2f76ce49-d9a2-4ffa-b6ef-c7212025b420.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240505%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240505T012518Z&X-Amz-Expires=300&X-Amz-Signature=31ae4b6eac7af9f6251ee9fd488f993a75405e4e5e4e7a00c4ec46ea1085bb6a&X-Amz-SignedHeaders=host&actor_id=5048531&key_id=0&repo_id=794278877)  | ![Screenshot 2](https://github-production-user-asset-6210df.s3.amazonaws.com/5048531/327983157-df82681d-4a83-4459-a895-f80fcea04f50.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240505%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240505T012747Z&X-Amz-Expires=300&X-Amz-Signature=cdf63fdbb0bab364fe407441ad1582c733548a335503d2815726e1ca5c6cf21d&X-Amz-SignedHeaders=host&actor_id=5048531&key_id=0&repo_id=794278877) | ![Screenshot 3](https://github-production-user-asset-6210df.s3.amazonaws.com/5048531/327983162-101172fe-1fe6-42a8-956c-731cec44d3f0.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240505%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240505T012809Z&X-Amz-Expires=300&X-Amz-Signature=a312d0d4171cc484f3d7cb7256468973693f058305c7a52c87c33d89e3a418c1&X-Amz-SignedHeaders=host&actor_id=5048531&key_id=0&repo_id=794278877) | ![Screenshot 4](https://github-production-user-asset-6210df.s3.amazonaws.com/5048531/327983166-386d961e-5b47-4eb3-a546-8d993eac0ef4.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240505%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240505T012832Z&X-Amz-Expires=300&X-Amz-Signature=de305dad1694ac388a0a7de11abf2bfede192d4d3e57ecb369fb29117e8209bc&X-Amz-SignedHeaders=host&actor_id=5048531&key_id=0&repo_id=794278877) |
|-----------------------------------|-----------------------------------|-----------------------------------|-----------------------------------|
| Pokemon Detail Screen                 | Favorite Pokemon Detail Screen                    | Favorites Screen                     | Empty Favorites Screen                     |


## Architecture

PokeTok adheres to a clean architecture approach, emphasizing modularity, separation of concerns, and testability. The architecture incorporates elements of the MVVM pattern, with Models utilizing ChangeNotifier for reactive updates.

### Layers:

- **Presentation Layer**: Implemented using Widgets and Models with ChangeNotifiers. Views are responsible for rendering UI elements, while Models handle business logic and state management.

- **Domain Layer**: Usecases encapsulate business logic and interact with repositories to retrieve or manipulate data. This layer defines the core functionality of the application, independent of any specific UI framework or data source.

- **Data Layer**: Utilizes the repository pattern to abstract data sources. RemoteDataSource communicates with external APIs using an HTTP client, while a simple caching network strategy enhances performance by storing data locally. Shared preferences serve as a local data source for caching and persisting favorite Pokémon.

### Key Components:

- **RemoteDataSource**: Responsible for fetching data from the PokeAPI using HTTP requests.

- **Repository Pattern**: Provides a clean interface for accessing data from multiple sources, abstracting away the implementation details.

- **Caching Strategy**: Utilizes shared preferences for local data caching, improving performance by reducing network calls. Cached data includes Pokémon information and user favorites.

By following this architecture, PokeTok maintains a robust and maintainable codebase, facilitating future enhancements and ensuring scalability.


## Features

- Browse through a collection of Pokémon profiles presented in a TikTok-style feed. [PageView + Pagination]
- Save your favorite Pokémon to easily access them later. [LocalStorage with SharedPreference]
- Enjoy a visually appealing and interactive experience while discovering new Pokémon. [For better experience, a simple caching network response was implemented]

## Roadmap

PokeTok is an evolving project with several areas for improvement:

1. **Caching Strategy Enhancement**: Implement a more robust caching strategy by replacing SharedPrefs with a database solution like Hive. Additionally, introduce cache data expiration to ensure freshness.
2. **State Management Refactoring**: Consider migrating from the current ChangeNotifier-based state management system to Bloc or Riverpod for better scalability and maintainability.
3. **Increased Test Coverage**: Enhance test coverage to ensure the reliability and stability of the application.

## Known Issues

- Currently, PokeTok has only been tested on Android devices due to limitations in device availability. Testing on iOS devices is planned for future releases.

## Dependencies

PokeTok relies on the following dependencies:

- `http` for making HTTP requests to the PokeAPI.
- `shared_preferences` for simple data persistence.
- `get_it` for dependency injection.
- `provider` for state management.
- `google_fonts` for incorporating custom fonts into the app.

## Getting Started

To get started with PokeTok, follow these steps:

1. Clone the repository to your local machine.
2. Ensure you have Flutter installed on your system.
3. Install the required dependencies by running `flutter pub get`.
4. Run the app on an Android device or emulator.

## Contributions

Contributions to PokeTok are welcome! If you encounter any issues or have suggestions for improvements, feel free to open an issue or submit a pull request on GitHub.

## License

PokeTok is licensed under the [MIT License](LICENSE).
