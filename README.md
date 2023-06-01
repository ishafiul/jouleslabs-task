# todo app

### note:
* this project using flutter `3.10.2`
* im using fvm as my flutter version manager
* makefile are written for fvm use

## How to run

### Get dependency

clone the project and run this script for  dependency

#### fvm
```
fvm flutter pub get
```
or
#### makefile

```
make pubGet

```
or

#### flutter
```
flutter pub get

```

### Run code genaretor


#### fvm
```
fvm flutter pub run build_runner watch --delete-conflicting-outputs
```
or
#### makefile

```
make buildRunner

```
or

#### flutter
```
flutter pub run build_runner watch --delete-conflicting-outputs

```

### Run debug/dev run


#### fvm
```
fvm flutter run
```
or

#### flutter
```
flutter run

```

### Run debug/dev run


#### fvm
```
fvm flutter run
```
or

#### flutter
```
flutter run

```




