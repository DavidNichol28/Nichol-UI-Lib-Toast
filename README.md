# nichol_ui_lib_toast

A lightweight, cross-platform toast notification system for Flutter using only Flutter’s Overlay system.

No native code, no dependencies — just simple UI overlays for quick notifications.

---

## Features

- One-line toast API
- Cross-platform (Android, iOS, Web, Desktop)
- Custom positioning (top / bottom)
- Short and long duration presets
- Fully customizable colors and text styling
- Zero external dependencies
- Lightweight overlay-based implementation

---

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  nichol_ui_lib_toast: ^0.0.1
```

## Usage
```dart
import 'package:nichol_ui_lib_toast/personal_toast.dart';

PersonalToast.show(
  context: context,
  msg: "Hello world!",
);
```

## Custom Usage
```dart
PersonalToast.show(
  context: context,
  msg: "Saved successfully!",
  toastLength: ToastLength.long,
  gravity: ToastGravity.top,
  backgroundColor: Colors.black,
  textColor: Colors.white,
  fontSize: 14.0,
);
```

## API Reference
```dart
NicholUILibToast.show
```

Uses Flutter’s Overlay system to display temporary UI elements above the widget tree.

No platform channels. No native dependencies.

#### Parameters
context → BuildContext (required)
msg → Message text (required)
toastLength → Duration preset (short, long)
gravity → Position on screen (top, bottom)
backgroundColor → Background color
textColor → Text color
fontSize → Font size

## Enums
```dart
enum ToastLength { short, long }

enum ToastGravity { top, bottom }

```
