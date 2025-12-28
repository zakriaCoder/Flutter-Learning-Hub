# Module 5: Navigation

## What is Navigation in Flutter?
Navigation means moving from one screen to another in a mobile application.
In real apps:
- Home → Details
- Login → Dashboard
- Module List → Lesson Page

Flutter treats each screen as a widget.

## Why Navigation Is Needed
Without navigation:
- App would have only one screen
- User cannot move between features
- App becomes unusable

Navigation allows:
- Organized content
- Better user experience
- Logical flow of app

## Navigating to Next Screen
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);
```
### Explanation of Code

Navigator manages screen stack
push adds a new screen
MaterialPageRoute defines how screen appears
context tells Flutter where we are
SecondScreen() is the new page

### Real-Life Example
Opening a new page in a book without closing the current page.

### Going Back to Previous Screen
DartNavigator.pop(context);
This removes the current screen and returns to the previous one.

### Real-Life Example
Closing a door to return to the previous room.

###  Navigation Stack Concept
Flutter maintains a stack of screens:

Push → Add screen
Pop → Remove screen

This ensures proper screen management.