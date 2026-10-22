# Unit Converter

A simple iOS unit-conversion app for quickly converting everyday values without leaving the current screen. **Unit Converter** uses a clean, calculator-style interface where you choose a conversion category, enter a value, select the starting unit, and view the converted results instantly.

The app is designed for straightforward daily calculations involving **temperature, weight, and distance**.

## What the app is for

Unit Converter helps users compare common measurements at a glance:

- Convert temperatures between Fahrenheit, Celsius, and Kelvin.
- Convert weights between grams, kilograms, and pounds.
- Convert distances between meters, kilometers, miles, and feet.
- Enter values with an on-screen numeric keypad instead of relying on the system keyboard.
- View all supported destination units together after pressing **Convert**.

## Features

### Conversion categories

| Category | Input units | Results |
| --- | --- | --- |
| **Temperature** | °F, °C, K | The other two temperature units |
| **Weight** | g, kg, lb | The other two weight units |
| **Distance** | m, km, miles, ft | The other three distance units |

### Calculator-style input

- Number buttons from `0` to `9`.
- Decimal input with protection against entering more than one decimal point.
- Negative-value button for temperature values.
- Delete button for removing the last character.
- Clear button for resetting both the input and result displays.
- Dedicated **Convert** button for calculating the result.

### Context-aware unit selection

The interface only shows the unit selector that belongs to the selected category. Choosing **Temperature**, **Weight**, or **Distance** automatically changes the available unit menu so the screen stays focused and easy to use.

### Visual design

The current interface follows the look shown in the screenshots:

- Dark gray application background.
- Orange category, unit, and conversion controls.
- Large calculator-style numeric buttons.
- Separate input and result areas.
- Compact portrait-oriented layout built in UIKit Storyboards.

## Conversion rules and constraints

The app intentionally keeps the conversion model small and predictable:

- **Temperature cannot be below absolute zero:**
  - Fahrenheit: `-459.67 °F`
  - Celsius: `-273.15 °C`
  - Kelvin: `0 K`
- **Weight values must be zero or greater.**
- **Distance values must be zero or greater.**
- Only one decimal point can be entered for a value.
- The negative sign can only be added when the input is empty, which is appropriate for temperature input but prevents negative weight and distance values from being entered through the keypad.
- A conversion is performed only after the user presses **Convert**.
- Results are displayed as text with the converted values and their units.
- The app currently supports one input value and one selected source unit at a time; it does not provide compound-unit calculations, history, favorites, or live conversion while typing.

## How to use it

1. Choose **Temperature**, **Weight**, or **Distance** from the category menu.
2. Choose the unit of the value you want to convert.
3. Enter a number using the on-screen keypad.
4. Use the decimal or negative buttons when needed.
5. Tap **Convert** to display the converted values.
6. Tap **Clear** to start over, or use the delete button to correct the last digit.

## Screenshots

The screenshots below show the category/unit menus, calculator input, and conversion result states used by the app.

<table>
  <tr>
    <td align="center"><strong>User Interface</strong><br><img src="https://github.com/user-attachments/assets/32c4b0f9-f7df-4aeb-96b8-5e9aea6887c0" alt="Unit Converter main screen" width="260"></td>
    <td align="center"><strong>Category Selction</strong><br><img src="https://github.com/user-attachments/assets/420ee64e-42db-419c-a769-72864a93207f" alt="Unit category menu" width="260"></td>
    <td align="center"><strong>Temperature units</strong><br><img src="https://github.com/user-attachments/assets/ea1aee27-f20f-442c-82d8-45b2e84ab048" alt="Temperature unit menu" width="260"></td>
  </tr>
  <tr>
    <td align="center"><strong>Weight Unit</strong><br><img src="https://github.com/user-attachments/assets/10ace1f5-3014-45bf-8d28-f2f4d35ca9cf" alt="Numeric keypad" width="260"></td>
    <td align="center"><strong>Distance Unit</strong><br><img src="https://github.com/user-attachments/assets/15b281a5-ca7b-4c6f-aaa0-8b9de9851eca" alt="Input and conversion controls" width="260"></td>
    <td align="center"><strong>Constraints</strong><br><img src="https://github.com/user-attachments/assets/43405b17-9ea3-40aa-87f1-1c07eb2d663f" alt="Conversion result screen" width="260"></td>
  </tr>
</table>

## Technology

- **Swift 5**
- **UIKit**
- **Storyboard-based interface**
- **Xcode project** targeting iPhone and iPad layouts
- No external dependencies or third-party packages

## Run locally

1. Clone the repository.
2. Open `unitConverter/unitConverter.xcodeproj` in Xcode.
3. Select an iPhone or iPad simulator.
4. Build and run the `unitConverter` target.

The main interface is defined in `unitConverter/unitConverter/Base.lproj/Main.storyboard`, while conversion behavior and input handling live in `unitConverter/unitConverter/ViewController.swift`.

## Project structure

```text
Unit-Converter/
├── README.md
└── unitConverter/
    ├── unitConverter.xcodeproj/
    └── unitConverter/
        ├── AppDelegate.swift
        ├── SceneDelegate.swift
        ├── ViewController.swift
        ├── Info.plist
        ├── Assets.xcassets/
        └── Base.lproj/
            ├── Main.storyboard
            └── LaunchScreen.storyboard
```

## Current scope

This project focuses on a small, offline, single-screen conversion experience. It does not currently include persistence, conversion history, networking, localization, custom themes, or user-defined units.
