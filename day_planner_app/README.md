# Day Planner App

A beautiful, feature-rich Flutter day planner application with a modern, creative design and advanced productivity features.

---

## ✨ Features

### 🎯 Core Functionality

- **Task Management**: Add, edit, delete, and mark tasks as complete
- **Persistent Storage**: All tasks are saved locally using Hive database
- **Dark/Light Theme**: Toggle between beautiful dark and light themes
- **Calendar View**: Visual calendar showing tasks for each day
- **Reminders & Notifications**: Set custom reminders for your tasks with local notifications
- **Productivity Stats & Streaks**: View your daily/weekly productivity and streaks (if implemented)
- **Animated UI**: Smooth transitions, confetti, and micro-interactions
- **Responsive Layout**: Works perfectly on all screen sizes (web, desktop, mobile)

### 🎨 Design & UX

- **Modern UI**: Clean, attractive design with custom theming
- **Theme-aware Input Dialogs**: Input fields and dialogs adapt to dark/light mode for best visibility
- **Completed Task Styling**: Completed tasks use theme-matching colors and improved contrast
- **Material Design**: Follows Material Design principles with creative enhancements

### 📱 Main Screens

- **Home Screen**: Main task list, add/edit dialogs, productivity stats, and navigation
- **Calendar Screen**: Monthly calendar view with task indicators and per-day task lists
- **Stats Screen**: (Optional) Productivity stats and streaks

---

## 📸 Screenshots

> __

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android SDK, NDK, CMake (for Android builds)
- Java 21 (for latest Android tools)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd day_planner_app
   ```
2. **Install dependencies**
   ```bash
   flutter pub get
   ```
3. **Run the app**
   ```bash
   # For web
   flutter run -d chrome
   # For Android
   flutter run -d android
   # For Windows
   flutter run -d windows
   # For iOS
   flutter run -d ios
   ```

---

## 📁 Project Structure

```
lib/
├── core/
│   └── app_theme.dart              # Theme configuration (legacy)
├── models/
│   ├── task.dart                  # Task data model (Hive)
│   └── habit.dart                 # (Optional) Habit data model
├── providers/
│   ├── task_provider.dart         # Task state management (CRUD, notifications)
│   ├── theme_provider.dart        # Theme state management (dark/light, persistence)
│   └── habit_provider.dart        # (Optional) Habit state management
├── screens/
│   ├── home_screen.dart           # Main task list, add/edit, stats, navigation
│   ├── calendar_screen.dart       # Calendar view with per-day tasks
│   └── stats_screen.dart          # (Optional) Productivity stats and streaks
├── services/
│   ├── local_storage_service.dart # Hive database operations
│   └── notification_service.dart  # Notification scheduling/canceling
├── widgets/
│   └── custom_button.dart         # Reusable UI components
└── main.dart                      # App entry point, provider setup
```

---

## 🛠️ Technologies Used

- **Flutter**: UI framework
- **Provider**: State management
- **Hive**: Local database storage
- **Table Calendar**: Calendar widget
- **Flutter Local Notifications**: Reminders
- **Timezone**: Accurate notification scheduling
- **Google Fonts**: Beautiful typography
- **UUID**: Unique ID generation

---

## 🧩 Main Components & Functions

### Models

- **Task**: id, title, description, dateTime, isCompleted, reminderDateTime (Hive)
- **Habit**: (optional, for future features)

### Providers

- **TaskProvider**: Handles all task CRUD, toggling, loading from storage, and notification scheduling
- **ThemeProvider**: Manages dark/light mode, theme persistence, and provides theme colors/gradients
- **HabitProvider**: (optional, for future habit tracking)

### Services

- **LocalStorageService**: Handles all Hive database operations for tasks
- **NotificationService**: Schedules, updates, and cancels local notifications for reminders

### Screens

- **HomeScreen**: Task list, add/edit dialogs, productivity stats, navigation, confetti/animations
- **CalendarScreen**: TableCalendar view, per-day task lists
- **StatsScreen**: (optional) Productivity stats and streaks

### Widgets

- **CustomButton**: Reusable styled button

---

## 🎯 How to Use

### Adding Tasks

1. Tap the floating action button (+)
2. Enter task title, description, date/time, and optional reminder
3. Tap "Add Task"

### Managing Tasks

- **Edit**: Tap the edit icon on any task
- **Delete**: Tap the delete icon on any task
- **Complete**: Tap the checkbox to mark as done (with confetti animation)
- **View Details**: Tap on a task to see full details

### Navigation

- **Home**: Main task list
- **Calendar**: Monthly view with task indicators
- **Stats**: (optional) Productivity stats and streaks
- **Theme Toggle**: Switch between dark and light themes

### Calendar View

- Navigate between months
- See task indicators on dates
- Tap on dates to see tasks for that day

---

## 🐛 Troubleshooting & Environment Setup

### Common Issues

1. **Build Errors**: Run `flutter clean` then `flutter pub get`
2. **Provider Errors**: Ensure all providers are properly registered in `main.dart`
3. **Storage Issues**: Check Hive initialization in `main.dart`
4. **Notification Issues**: Ensure NotificationService is initialized and permissions are granted

### Android Build Issues

- **NDK Version Mismatch**: Set `ndkVersion = "27.0.12077973"` in `android/app/build.gradle.kts`
- **CMake Issues**: Install CMake 3.22.1 via SDK Manager or `sdkmanager "cmake;3.22.1"`
- **Java Version**: Use Java 21 for latest Android tools
- **sdkmanager Not Found**: Add `cmdline-tools/latest/bin` to your PATH and restart your terminal/PC
- **Corrupted NDK**: Reinstall NDK and CMake via Android Studio SDK Manager

### PATH Setup Example (Windows)

```powershell
setx PATH "$env:PATH;C:\Users\USER\AppData\Local\Android\Sdk\cmdline-tools\latest\bin"
```

---

## 📝 Future Enhancements

- [ ] Productivity statistics and streaks (advanced stats screen)
- [ ] Cloud synchronization
- [ ] Advanced notifications (push, recurring)
- [ ] Task categories and tags
- [ ] Export/import functionality
- [ ] Widget support
- [ ] Multi-language support
- [ ] Habit tracking

---


## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---



**Happy Planning! 🎉**
