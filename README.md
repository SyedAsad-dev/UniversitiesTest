# UniversityLists
Swift Assessment Test 

## Building And Running The Project (Requirements)
* Swift 5.0+
* UIKit
* Xcode 15.3+
* iOS 17+
* MacOS Sonoma 14.4.1

# Getting Started
- If this is your first time encountering swift/ios development, please follow [the instructions](https://developer.apple.com/support/xcode/) to setup Xcode and Swift on your Mac.


## Setup Configs
- Checkout master branch to run latest version
- Open the project by double clicking the `Universities.xcodeproj` file
- Select the build scheme which can be found right after the stop button on the top left of the IDE
- [Command(cmd)] + R - Run app
```
// App Settings
APP_NAME = Universities
PRODUCT_BUNDLE_IDENTIFIER = asd.asd.Universities

#targets:
* Universities
 * ListModuleTest
```


# Build and or run application by doing:
* Select the build scheme which can be found right after the stop button on the top left of the IDE
* [Command(cmd)] + B - Build app
* [Command(cmd)] + R - Run app


## Accomplished:
- Interface Modularization.
- Composite Root technique.
- SOLID principle.
- DI Container.
- VIPER Architecture.
- CoreData.
- Offline Support.
- No Reactive Programming.
- No Async/Await.
- Unit Tests.

Without any implementation of third party libraries.

## Architecture
This application uses the VIPER UI architecture with modular approach using DI Container.

<p align="center"> <img src="https://miro.medium.com/v2/resize:fit:1400/1*saKX3Dssawi-Z4zT0mNRmQ.png" width="600" height="300">

<img src="https://miro.medium.com/v2/resize:fit:1400/1*lR0AqgxKy5H7bFFQbYQeeA.png" width="600" height="300">
</p>

## Structure

### Modules
- Include Common, DetailModule, ListModule.

### Domain
- Include Entities, Protocols

### Data
- Include CoreDataRepository, ListServiceRepository, DataSource, Networking etc.

### Navigator Panel
<p align="center"> 
<img src="https://github.com/SyedAsad-dev/UniversitiesTest/assets/58474263/c16012e2-4864-4b3d-b28f-3f200907b3c4" width="542" height="802">
</p>

### Graph View

<p align="center"> 
<img src="https://d33wubrfki0l68.cloudfront.net/59d7c1b1e215f50cd6d95a02f7d7ca4990bb6ee5/a1aac/public/images/posts/modern-approach-modularize-ios-swiftui-spm/clean-architecture-modules-relationships.png" width="900" height="450">
</p>

## Screen shots:

### Dark mode
<p align="center"> 
<img src="https://github.com/SyedAsad-dev/UniversitiesTest/assets/58474263/d91896b2-f583-4640-9c67-ae9ed1085ac7" width="250" height="500">

<img src="https://github.com/SyedAsad-dev/UniversitiesTest/assets/58474263/89589505-77fc-488f-940b-e6555fe31ad6" width="250" height="500">
</p>

### Light mode

<p align="center"> 
<img src="https://github.com/SyedAsad-dev/UniversitiesTest/assets/58474263/79f35320-a7fa-4188-a09b-edb13ca1ce0f" width="250" height="500">

<img src="https://github.com/SyedAsad-dev/UniversitiesTest/assets/58474263/34043941-3a3a-494f-9698-b44213055a16" width="250" height="500">

<img src="https://github.com/SyedAsad-dev/UniversitiesTest/assets/58474263/8e1c30c0-e10b-4563-b695-f613f93383e4" width="250" height="500">
</p>
