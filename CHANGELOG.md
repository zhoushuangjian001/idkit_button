## 0.0.1

- Convenient expansion of button components

  1.  Text button
      ```dart
      factory IDKitButton.title(...) -> IDKitButton
      ```
  2.  Image button
      ```dart
      factory IDKitButton.image(...) -> IDKitButton
      ```
  3.  Image and text button
      ```dart
      factory IDKitButton.imageAndText(...) -> IDKitButton
      ```
  4.  Cut corner type button

      ```dart
      factory IDKitButton.corner(...) -> IDKitButton
      ```

  5.  Gradient type button
      ```dart
      factory IDKitButton.gradient(...) -> IDKitButton
      ```
  6.  Border type button

      ```dart
      factory IDKitButton.outline(...) -> IDKitButton
      ```

  7.  Custom type button

      ```dart
      const IDKitButton(...) -> IDKitButton
      ```

## 0.0.2

1. Replaced StreamControl for buttons with Stream.
2. Set the default value of the button when it is not available.
