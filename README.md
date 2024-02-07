# single_app

A new Flutter project.

## Getting Started

Make sure to use the same Flutter version that this project requires! 

`3.7.12`

I do recommend you use [Flutter Version Manager](https://fvm.app/docs/getting_started/installation)

Then if you use Android Studio do the following:

Settings -> Languages And Frameworks -> Flutter -> Flutter Sdk Path

Insert there the relative path of .fvm/flutter_sdk
For example `/pathToMyCode/flutter_tui/.fvm/flutter_sdk`

If the required flutter version is missing you can install it like this:

```shell
fvm install 3.7.12
```

In your terminal for the project run
```shell
fvm use 3.7.12
```

Then you can run `fvm flutter` instead of just `flutter` in order to use the project specific flutter.

For example, while being inside this project directory just do `fvm flutter pub get` and will use version 3.7.12 for the request.
