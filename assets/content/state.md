# Module 6: State Management Basics

## What is State?
State is data that can change during app usage.

### Examples
- Quiz score
- Dark mode ON/OFF
- Completed lessons

## Why State Management Is Important
Without state:
- UI cannot update
- User interaction is meaningless
- App feels broken

State management ensures:
- UI reflects data changes
- App behaves correctly

## setState()
setState() tells Flutter:  
“Something has changed, rebuild the UI.”


setState(() 
{
  score++;
});

### Explanation

- Data changes inside setState
- Flutter redraws UI
- New value appears on screen

### Real-Life Analogy
A scoreboard that updates score after every goal.