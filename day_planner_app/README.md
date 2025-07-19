# Day Planner App

A beautiful and feature-rich Flutter day planner application with a modern, creative design and amazing functionality.

## ✨ Features

### 🎯 Core Functionality

- **Task Management**: Add, edit, delete, and mark tasks as complete
- **Persistent Storage**: All tasks are saved locally using Hive database
- **Dark/Light Theme**: Toggle between beautiful dark and light themes
- **Calendar View**: Visual calendar showing tasks for each day
- **Reminder System**: Set custom reminders for your tasks

### 🎨 Design Features

- **Modern UI**: Clean, attractive design with smooth animations
- **Responsive Layout**: Works perfectly on different screen sizes
- **Custom Animations**: Beautiful transitions and micro-interactions
- **Material Design**: Follows Material Design principles with custom theming

### 📱 Screens

1. **Home Screen**: Main task list with add/edit functionality
2. **Calendar Screen**: Monthly calendar view with task indicators

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code

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

   # For iOS
   flutter run -d ios
   ```

## 📁 Project Structure

```
lib/
├── core/
│   └── app_theme.dart          # Theme configuration
├── models/
│   ├── task.dart              # Task data model
│   └── habit.dart             # Habit data model
├── providers/
│   ├── task_provider.dart     # Task state management
│   └── theme_provider.dart    # Theme state management
├── screens/
│   ├── home_screen.dart       # Main task list screen
│   └── calendar_screen.dart   # Calendar view screen
├── services/
│   ├── local_storage_service.dart  # Hive database operations
│   └── notification_service.dart   # Notification handling
├── widgets/
│   └── custom_button.dart     # Reusable UI components
└── main.dart                  # App entry point
```

## 🛠️ Technologies Used

- **Flutter**: UI framework
- **Provider**: State management
- **Hive**: Local database storage
- **Table Calendar**: Calendar widget
- **UUID**: Unique ID generation
- **Google Fonts**: Beautiful typography

## 🎯 How to Use

### Adding Tasks

1. Tap the floating action button (+)
2. Enter task title and description
3. Set date and time
4. Optionally set a reminder
5. Tap "Add Task"

### Managing Tasks

- **Edit**: Tap the edit icon on any task
- **Delete**: Tap the delete icon on any task
- **Complete**: Tap the checkbox to mark as done
- **View Details**: Tap on a task to see full details

### Navigation

- **Home**: Main task list
- **Calendar**: Monthly view with task indicators
- **Theme Toggle**: Switch between dark and light themes

### Calendar View

- Navigate between months
- See task indicators on dates
- Tap on dates to see tasks for that day

## 🔧 Customization

### Adding New Features

The app is built with a modular architecture, making it easy to add new features:

1. **New Models**: Add to `models/` directory
2. **New Screens**: Add to `screens/` directory
3. **New Services**: Add to `services/` directory
4. **New Providers**: Add to `providers/` directory

### Theme Customization

Edit `lib/core/app_theme.dart` to customize colors, fonts, and styling.

## 🐛 Troubleshooting

### Common Issues

1. **Build Errors**: Run `flutter clean` then `flutter pub get`
2. **Provider Errors**: Ensure all providers are properly registered in `main.dart`
3. **Storage Issues**: Check Hive initialization in `main.dart`

### Android Build Issues

If you encounter Android NDK issues:

1. Install Android NDK manually
2. Update `android/app/build.gradle.kts` with correct NDK version
3. Or use web platform for testing: `flutter run -d chrome`

## 📝 Future Enhancements

- [ ] Productivity statistics and streaks
- [ ] Cloud synchronization
- [ ] Advanced notifications with actual push notifications
- [ ] Task categories and tags
- [ ] Export/import functionality
- [ ] Widget support
- [ ] Multi-language support

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Hive team for the lightweight database
- Provider team for state management
- All contributors and users

---

**Happy Planning! 🎉**
