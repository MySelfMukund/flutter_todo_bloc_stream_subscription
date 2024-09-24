# Flutter Todo App (Bloc + StreamSubscription)

A Todo app built using Flutter, implementing the **Bloc Pattern** with **StreamSubscription** for efficient state management and real-time task updates.

## Features

- Add, delete, and update tasks.
- Mark tasks as complete or incomplete.
- Real-time updates using **StreamSubscription**.
- Uses **Bloc** for managing state.
- Persistent task storage.

## Screenshots

_Include some screenshots showcasing your app, like task list view, add task screen, etc._

## Getting Started

### Prerequisites

Make sure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Android Studio or Visual Studio Code (for development)
- A device/emulator for testing

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/MySelfMukund/flutter_todo_bloc_stream_subscription.git

2. Navigate to the project folder:
   ```bash
   cd flutter_todo_bloc_stream_subscription

3. Install the dependencies:
   ```bash
   flutter pub get
   
5. Run the app:
   ```bash
   flutter run

### Project Structure
Here's an overview of the project folder structure:

   ```bash
   lib/
   ├── cubits/             # Contains Cubits and Bloc logic
   ├── models/             # Data models for tasks
   ├── repository/         # Logic for data storage and retrieval
   ├── screens/            # UI components (screens)
   ├── widgets/            # Reusable UI components
   └── main.dart           # Main entry point

## How It Works

- **Bloc Pattern** is used for managing the state of tasks in the app, ensuring separation of concerns and cleaner code.
- **StreamSubscription** listens for task changes in real time and updates the UI accordingly.
- **Repository Layer** handles data persistence, ensuring that tasks are stored and retrieved efficiently.

## State Management

- **Bloc/Cubit:** Used to manage state changes for tasks (add, delete, update).
- **StreamSubscription:** Listens to task updates and streams them to the UI for real-time interaction.

## Technologies Used

- **Flutter** - Cross-platform development framework
- **Bloc (Cubit)** - State management
- **StreamSubscription** - For real-time updates and task management

