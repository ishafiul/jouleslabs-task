SHELL := /bin/bash



### Build Runner
buildRunner:
	fvm flutter pub run build_runner watch --delete-conflicting-outputs


### Build Runner
pubGet:
	fvm flutter pub get

### Build apk
apkBuild:
	fvm flutter build apk --split-per-abi

### build aab app bundle
releaseBuild:
	fvm flutter build appbundle