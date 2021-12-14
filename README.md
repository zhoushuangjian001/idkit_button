# idkit_button

This package mainly deals with the convenient construction of button components that interact with users in the development of the flutter project.

## Features included in this package

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

## The package function example demonstration

1.  Text button

    ```dart
    IDKitButton.title(
      'Next',
      height: 44,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
      ),
      onTap: () {
        print('Button on click!');
      },
    )
    ```

2.  Image button

    ```dart
    IDKitButton.image(
      imgpath,
      width: 100,
      bgColor: Colors.red,
      onTap: () {
        print('Button on click!');
      },
    ),
    ```

3.  Image and text button

    ```dart
    IDKitButton.imageAndText(
      imgpath,
      'Setup',
      height: 120,
      imgSize: const Size(100, 200),
      bgColor: Colors.blue,
      onTap: () {
        print('Button on click!');
      },
    )
    ```

4.  Cut corner type button

    ```dart
    IDKitButton.corner(
      bgColor: Colors.blue,
      height: 60,
      width: 100,
      onTap: () {
        print('Button on click!');
      },
    )
    ```

5.  Gradient type button

    ```dart
    IDKitButton.gradient(
      const <Color>[Colors.red, Colors.green],
      width: 200,
      height: 60,
      title: 'Finish',
      onTap: () {
        print('Button on click!');
      },
    )
    ```

6.  Border type button

    ```dart
    IDKitButton.outline(
      title: 'Border Button',
      padding: const EdgeInsets.all(20),
      onTap: () {
        print('Button on click!');
      },
    )
    ```

7.  Custom type button

    ```dart
    IDKitButton(
      decoration: BoxDecoration(
          image: DecorationImage(
          image: NetworkImage(imgpath),
          fit: BoxFit.fill,
          ),
      ),
      title: 'Backgrount button',
      height: 60,
    )
    ```
