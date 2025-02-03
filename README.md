# TheMovieApp

TheMovieApp is a SwiftUI-based application for browsing, favoriting, and tracking movies. It includes features for viewing detailed information about movies, managing favorites and watched movies, and exploring similar movies.

---

## Project Architecture

The application follows the MVVM (Model-View-ViewModel) architecture, ensuring separation of concerns and maintainability. Below is an overview of the folder structure:

### Folder Structure

- **Components**: Contains reusable views such as `MovieButtonsView` and `MovieImageView`.
- **Favorites**: Manages favorite movies with view models and views.
- **Keychain**: Handles secure storage using `AppStateManager` and `KeychainManager`.
- **Models**: Defines core models like `Genre`, `Movie`, and `MovieResponse`.
- **MovieCollection**: Displays a list of movies using `MovieCollectionView` and its associated view model.
- **MovieDetails**: Provides detailed information about a movie using `MovieDetailsView` and related components.
- **Root**: Manages navigation and entry points, including the splash screen and main tab view.
- **Service**: Implements API communication (`APIService`), configuration (`APIConfig`), and data handling (`MovieRepository`).
- **Tests**: Includes unit and integration tests for the app.

---

## Screenshots

### Architecture Overview
![Screenshot 2025-02-03 at 12 54 46](https://github.com/user-attachments/assets/9461d5b0-78f9-4039-88d7-abddd5896d3d)


### Splash Screen
![Simulator Screenshot - iPhone 16 Pro - 2025-02-03 at 12 57 13](https://github.com/user-attachments/assets/03306365-4f10-4011-8511-9e5bb3a296a7)


### Movie Collection

![Simulator Screenshot - iPhone 16 Pro - 2025-02-03 at 12 57 15](https://github.com/user-attachments/assets/50343be1-3801-4dce-8f16-87cdd529eaff)


### Movie Details

![Simulator Screenshot - iPhone 16 Pro - 2025-02-03 at 12 57 40](https://github.com/user-attachments/assets/aa674403-c5a4-4870-ac70-0d560835180f)


### Similar Movies

![Simulator Screenshot - iPhone 16 Pro - 2025-02-03 at 12 57 49](https://github.com/user-attachments/assets/68da03db-2bbe-4be9-93a4-fa87785cc8b3)


### Favorites Tab

![Simulator Screenshot - iPhone 16 Pro - 2025-02-03 at 12 58 01](https://github.com/user-attachments/assets/a279f052-1bf0-4962-9597-b4e5ad3c1937)


### Watched Tab

![Simulator Screenshot - iPhone 16 Pro - 2025-02-03 at 12 58 17](https://github.com/user-attachments/assets/c07e39bd-6a22-4ee8-b2cd-52767d787e5b)


---

## Features

1. **Movie Collection**: Browse a list of top-rated movies.
2. **Movie Details**: View detailed information about a selected movie.
3. **Favorites**: Add movies to your favorites list and manage them easily.
4. **Watched Movies**: Track movies you have already watched.
5. **Similar Movies**: Discover similar movies based on the current selection.
6. **Secure Data Handling**: Utilizes Keychain for secure storage.
7. **Responsive Design**: Adapts to different device sizes and orientations.

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/TheMovieApp.git
   ```
2. Navigate to the project directory:
   ```bash
   cd TheMovieApp
   ```
3. Open `TheMovieApp.xcodeproj` in Xcode.
4. Build and run the app on your simulator or device.

---

## Requirements

- Xcode 14.0+
- iOS 16.0+
- Swift 5.7+

---

## Contributing

Contributions are welcome! Please fork the repository and create a pull request for your changes. Ensure your code follows the project's coding standards.

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

