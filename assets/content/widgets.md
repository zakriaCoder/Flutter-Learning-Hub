# Module 3: Flutter Widgets

## What is a Widget?
A widget describes how the UI should look. Flutter does not use XML layouts like traditional Android. Instead, UI is written directly using widgets.

Important Concept  
Flutter UI = Combination of Widgets  
Everything you see on screen is made by combining widgets.

## Stateless Widget
A StatelessWidget is used when:
- Data does not change
- UI remains fixed

Once built, it cannot update itself.

### Example Use Cases
- App title
- Static text
- Logos

Explanation  
If something never changes, Flutter does not need to rebuild it.

## Stateful Widget
A StatefulWidget is used when:
- Data changes
- UI needs updating

Stateful widgets can remember values and rebuild UI when those values change.

### Why StatefulWidget Is Important
Without state, apps would be static and boring.

### Examples
- Counter
- Quiz score
- Progress tracker
- Theme toggle

## Widget Tree
Flutter organizes widgets in a tree structure.
- Parent widget controls layout
- Child widgets appear inside it

### Why Widget Tree Matters
- Determines layout
- Controls data flow
- Helps Flutter rebuild UI efficiently