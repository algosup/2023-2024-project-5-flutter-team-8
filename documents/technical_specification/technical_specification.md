# Technical Specification

<details>
<summary>

## Table of content </summary>

- [Technical Specification](#technical-specification)
  - [Table of content ](#table-of-content-)
  - [I. Introduction](#i-introduction)
    - [1. Purpose](#1-purpose)
    - [2. Scope](#2-scope)
    - [3. Definitions, Acronyms, and Abbreviations](#3-definitions-acronyms-and-abbreviations)
  - [II. Conventions](#ii-conventions)
    - [1. Coding Standards](#1-coding-standards)
    - [2. Naming Conventions](#2-naming-conventions)
    - [3. Commenting and Documentation](#3-commenting-and-documentation)
  - [III. System Overview](#iii-system-overview)
    - [1. System Architecture](#1-system-architecture)
    - [2. Technology Stack](#2-technology-stack)
    - [3. Key Components](#3-key-components)
  - [IV. Application Architecture](#iv-application-architecture)
    - [1. Design Patterns](#1-design-patterns)
    - [2. State Management](#2-state-management)
    - [3. Navigation](#3-navigation)
  - [V. Data Management](#v-data-management)
    - [1. Data Models](#1-data-models)
    - [2. Local Storage](#2-local-storage)
  - [VI. Functional Requirements](#vi-functional-requirements)
    - [1. User Authentication](#1-user-authentication)
    - [2. User Profile Management](#2-user-profile-management)
      - [2.1. Personal Information](#21-personal-information)
      - [2.2. Skills](#22-skills)
      - [2.3. Certifications](#23-certifications)
      - [2.4. Notifications](#24-notifications)
      - [2.5. Jobs Liked](#25-jobs-liked)
      - [2.6. Logout](#26-logout)
    - [3. Job Offer Matching](#3-job-offer-matching)
    - [4. Swiping Interface](#4-swiping-interface)
    - [5. Notifications](#5-notifications)
  - [VII. User Interface Design](#vii-user-interface-design)
    - [1. UI Components](#1-ui-components)
    - [2. Screen Layouts](#2-screen-layouts)
    - [3. Themes and Styles](#3-themes-and-styles)
  - [VIII. Integration and Deployment](#viii-integration-and-deployment)
    - [1. Continuous Integration](#1-continuous-integration)
    - [2. Deployment Strategy](#2-deployment-strategy)
    - [3. Environment Configuration](#3-environment-configuration)
  - [IX. Maintenance and Support](#ix-maintenance-and-support)
    - [1. Logging and Monitoring](#1-logging-and-monitoring)
    - [2. Bug Reporting and Tracking](#2-bug-reporting-and-tracking)
    - [3. Updates and Upgrades](#3-updates-and-upgrades)
  - [X.  Appendices](#x--appendices)
    - [1. Glossary](#1-glossary)
    - [2. References](#2-references)
    - [3. Document Revision History](#3-document-revision-history)

</details>

## I. Introduction

### 1. Purpose

<!-- Outline the purpose of the document and the application. -->
This document is meant to explain how to create the application by implementing the features detailed in the [functional specification]().
The purpose of the application is to create a new way of recruiting people based on their soft skills and not their technical skills. It is also totally anonymized for better equality between the potential candidates.

### 2. Scope

<!-- Define the scope of the front-end project and what the document will cover. -->
This project should be done using Flutter and be compatible with all types of devices.

This implementation should be only targeting the front-end at first and should offer an interface to candidates, and companies but also "We are evolution." as an administrator.

### 3. Definitions, Acronyms, and Abbreviations

<!-- Provide definitions for any technical terms, acronyms, and abbreviations used in the document. -->

## II. Conventions

### 1. Coding Standards

<!-- Describe the coding standards and style guidelines to be followed (e.g., Dart/Flutter coding conventions). -->
This project is entirely made in the Flutter dart language, that's why it is logical and easy to keep the same coding convention as the Flutter.

Classes, enum types, typedefs, and type parameters should be in PascalCase:
```Dart
class ClassName { ... }

enum EnumName { ... }

typedef Predicate<T> = bool Function(T value);
```

Extensions have the same naming convention as Classes which is PascalCase:
```Dart
extension MyExtensionList<T> on List<T> { ... }
```

Packages, Files and Folders should be named in a snake_case style:
```
my_package
└─ lib
   └─ file_system.dart
   └─ slider_menu.dart
```

The name import prefixes should also be in a snake_case style:
```Dart
import 'dart:math' as math;
import 'package:angular_components/angular_components.dart' as angular_components;
import 'package:js/js.dart' as js;
```

Other identifiers such as Class members, top-level definitions, variables, parameters, and named parameters would be in a simple camelCase:

```Dart
var number = 3;

HttpRequest httpRequest;

void align(bool clearItems) {
  // ...
}
```

Prefer camelCase for constants or SCREAMING_CAPS if it was already used in the code source:
```Dart
const pi = 3.14;
```

Avoid using '_' before identifiers that are not private.\
Also, avoid prefix letters. \
Moreover, do not explicitly name libraries, Dart generates a unique tag for each library based on its path and filename.

The Flutter language is a prioritization in his import files, they should follow this order alphabetically:
- `dart:` imports
- `package:` imports
- relative imports
- exports

```Dart
import 'dart:async';
import 'dart:html';

import 'package:bar/bar.dart';
import 'package:foo/foo.dart';

import 'util.dart';

export 'src/error.dart';
```

Format comments like sentences for better understanding:
```Dart
// This comment explain ...
```
Avoid using block comments for documentation

### 2. Naming Conventions

<!-- Define naming conventions for variables, classes, methods, and other identifiers. -->
This project has two main naming conventions, which are the repository naming convention and the coding naming convention.

Some of the coding naming conventions were defined above in the previous section. Here are the missing ones:
```
path: kebab-case
function: camelCase
class: PascalCase
widget: PascalCase
```
The repository naming conventions are the following:
```
branches: kebab-case
folder: snake_case
file: snake_case
```
Moreover, all the branches have been defined previously.
|Names|Utilities|
|-----|---------|
|main |owning the final state of the project|
|documents|all the modifications related to the document, whatever it is, should be done on this branch|
|dev  |owning the most complete and functional version of the code|
|*code feature*|owning one specific function of the specific code, should be erased once merged to the dev branch|

The branches should be merged following a simple pull request system.
The lower branch should merge with the higher branch to avoid conflict. If there is none or when they are corrected, a pull request should be done to merge the lower branch to the higher one.
The hierarchy would follow this tree:
```
main
-> documents
-> dev
  -> One branch for each big feature
```

### 3. Commenting and Documentation

<!-- Outline how code should be commented and documented, including requirements for inline comments and documentation comments. -->
As said in section [1. Coding Standards](#1-coding-standards), the code should be commented on with single-line commentary and with clear sentences. \
It is recommended to be explicit and to use the most possible commentaries to inform potential software engineers of the use of each function.

## III. System Overview

### 1. System Architecture

<!-- Provide an overview of the front-end architecture, including diagrams (e.g., component diagrams). -->
Our GitHub repository will be created following the architecture hereunder:

```
Root
+---documents
| +---functional_specification
| | +---img
| | \---functional_specification.md
| +---technical_specification
| | \---technical_specification.md
| +---quality_assurance
| | \---test_plan.md
| | \---test_cases.md
| +---management
| | +---weekly_reports
| | | \---weekly_report_cumulative.md
| | | \---weekly_report_1.md
| | | \--- ...
| +---communication
| +---user_manual
| | \---user_manual.pdf
+---src
| +---.dart_tool
| +---.idea
| +---android
| +---build
| +---ios
| +---lib
| | \---login.dart
| | +---candidate
| | +---company
| +---linux
| +---macos
| +---web
| +---windows
\---README.md
\---.gitignore
```
The architecture of the application will be in the src/lib folder, containing all the pages of both the candidate and company sides.
<!-- list all the pages? -->

### 2. Technology Stack

<!-- List and describe the technologies and frameworks used (e.g., Flutter, Dart). -->
For this project, it has been decided to use the Flutter/Dart language as well as some famous extensions of it, which are:
- [riverpod](https://riverpod.dev/): which is a reactive caching framework for Flutter/Dart. Using declarative and reactive programming, Riverpod takes care of a large part of your application's logic for you.
- [freezed](https://pub.dev/packages/freezed): a code generator for data-classes/unions/pattern-matching/cloning.
- [go_router](https://pub.dev/packages/go_router): a declarative routing package for Flutter that uses the Router API to provide a convenient, url-based API for navigating between different screens. You can define URL patterns, navigate using a URL, handle deep links, and a number of other navigation-related scenarios.

### 3. Key Components

<!-- Describe the key components of the front-end (e.g., UI components, state management). -->


## IV. Application Architecture

### 1. Design Patterns

<!-- Discuss the design patterns employed in the application (e.g., MVVM, BLoC). -->

### 2. State Management

<!-- Describe the state management approach used (e.g., Provider, Riverpod, BLoC). -->

### 3. Navigation

<!-- Detail the navigation strategy (e.g., Navigator 2.0, named routes). -->
For the navigation between the different pages, go_routeur will be used. It is a simpler way to navigate between the pages than the one provided by default.
Here is what it would look like:
```Dart
GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/loading',
    routes: <RouteBase>[
      GoRoute(
        path: '/loading',
        name: 'loading',
        builder: (context, state) => const Loading(),
      ),
      GoRoute(
        path: '/splashScreen',
        name: 'splashScreen',
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}
```

```Dart
GoRouter.of(context).go('/splashScreen');
```

```Dart
@override
Widget build(BuildContext context) {
  return MaterialApp.router(
    routerConfig: router,
  ),
}
```

This is only a simple preview for the first two pages, all the pages would be defined hereunder:
| Names | Path | Descriptions |
| ----- | ---- | ------------ |
| 'logo' | '/logo' | loading screen |
| 'splash-screen' | '/splash-screen' | Description of the application|
| 'login' | '/login' | login with a password and a mail account|
| 'forget-password' | '/forget-password' |ask for a new password via the mail|
| 'type-user-choice' | '/type-user-choice' |chose if you are a company or a candidate|
| 'sign-up-user' | '/sign-up-user' | ask for the full name, the mail and the password of the user |
| 'soft-skills-choices' | '/soft-skills-choices' | a page with 40 skills predifined |
| 'soft-skills-rank' | '/soft-skills-rank' | page to rank the previously selected skills |
| 'location' | '/location' | page to put the address and the range around it |
| 'profile-picture' | '/profile-picture' | page to define user's profile picture|
| 'check-your-email' | '/check-your-email' | waiting screen for the mail to be checked|
| 'successfully' | '/successfully' | page when succesfully checked |
| 'home-screen' | '/home-screen' |main page with the job offer on bubble form |
| 'job-info' | '/job-info' | page when a bubble is clicked to have more information about the job|
| 'skills-categories' | '/skills-categories' | page where all the big certification categories are displayed |
| 'skills-selection' | '/skills-selection' | page where the certification are shown |
| 'message' | '/message' | page where all the chats are listed |
| 'chat' | '/chat' | specific chat with one company|
| 'no-message' | '/no-message' | page displayed when no messages|
| 'profile' | '/profile' | page to acces to the diverse settings |
| 'personal-information' | '/personal-information' | page displaying user's full name, mail, password and location |
| 'update-password' | '/update-password' |page to change the password |
| 'update-profile-picture' | '/update-profile-picture' | page tochange of profle picture|
| 'settings' | '/settings' | containing all the different kinds of notifications |
| 'jobs-liked' | '/jobs-liked' | containing a list of the jobs liked |
| 'profile-certification' | '/profile-certification' | the page to see the list of certification got |
| 'profile-skills' | '/profile-skills' | skills selected when registered |
| 'profile-add-skills' | '/profile-add-skills' | to add more or change the skills selected |
| 'profile-rank-skills' | '/profile-rank-skills' |to rank the skills selected |
| 'sign-up-company' | '/sign-up-company' | ask for company's name and registration number as well as responsible's mail and password|
| 'profile-picture-company' | '/profile-picture-company' | select a logo for the company |
| 'company-home-screen' | '/company-home-screen' | page where all the company's job offer are |
| 'no-offer' | '/no-offer' | page displayed when no job offer proposed |
| 'add-job-offer' | '/add-job-offer' | ask for the needed informaion (see the functional specification)|
| 'add-images' | '/add-images' | 6 slots to import images |
| 'add-soft-skills-job' | '/add-soft-skills-job' | select the soft skills needed for the job offer |
| 'skills-categories-company' | '/skills-categories-company' | big categorie for the certifications |
| 'skills-selection-company' | '/skills-selection-company' | list of the different certification created by the company on a specific category |
| 'message-qualified-company' | '/message-qualified-company' | chat list where the candidate met the prerequisites |
| 'message-unqualified-company' | '/message-unqualified-company' | chat list where the candidate don't met the prerequisites |
| 'profile-company' | '/profile-company' | where the profile is displayed |

## V. Data Management

### 1. Data Models

<!-- Define the data models used in the application (e.g., JobOffer, User, SoftSkill). -->

### 2. Local Storage

<!-- Describe any local storage mechanisms used (e.g., shared_preferences, SQLite). -->

## VI. Functional Requirements

### 1. User Authentication

<!-- Describe the user authentication process and integration with back-end services. -->
For the user authentication, only the front end is asked. Two profiles would then be set beforehand, one for the company and one for the user. \
To see if the authentification is done the text put in the box should be the same as the predefined earlier in both the mailbox and the passwordbox. \
For this, a textfield and a controller would be used for simpler usage. \
The mail Textfield will be checked first to know which password is the right one, if the authentification is passed the password textfield is checked, if the password is correct it will change the page to the main page of the company or the user according to the one who registered. \
There is a diagram to understand it better:
![authentication_diagram](img/authentification_check.png)

The code in the router file would have a builder like this:
```Dart
builder: (context, state) {
  if (authService.isAuthenticated == true){
    return const Settings();
  }
  return const LoginScreen();
}
```
The authentification class should be expressed this way:
```Dart
class AuthService {
  bool isAuthenticated = false;

  login (String code){
      isAuthenticated = (code == '1234');
      return isAuthenticated;
  }

  logout (){
    isAuthenticated = false;
  }
}
final AuthService authService = AuthService();
```
Finally, textfields would be similar to this example (``obscureText`` only for the password):
```Dart
_passwordController.value;

TextField(
    controller: _passwordController,
    decoration: const InputDecoration(labelText: 'Password'),
    obscureText: true,
  ),
```

### 2. User Profile Management

<!-- Detail how users can manage their profiles (e.g., update soft skills, personal info). -->
To access the User Profile you should click on the bottom right icon (![alt text](../functional_specification/img/app_img/profile_logo.png)) in the bottomBar provided by Flutter.
When on the User Profile Page the icon changes to this ![alt text](../functional_specification/img/app_img/profile_logo_black.png) implying you are on the right page.
It would look like that:
```Dart

```
When on the page, six buttons will be displayed to access respectively:
- Personal Information
- Skills
- Certifications
- Notifications
- Jobs liked
- Logout
 
When pressed, it would redirect to the corresponding page.
To get back to the Profile Page, the left arrow on the AppBar should be clicked.

#### 2.1. Personal Information

This page would be composed of many ``TextField`` Boxes containing the Full name, the password, the e-mail and the Location.
Under them should be displayed a sliding range bar to express the radius around the location to find a job.

In the password's ``TextField`` there should be a right arrow in the right of the box.
When clicked, a new page should open. This page would be used to update/change the password. For this, the page would contain three others ``TextField`` for the old password, the new password, and the confirmation of the new password. All of these three boxes should have ``obscureText`` set as true inside.
A button would be displayed at the bottom of the page to update the password when pressed.

For this bar, the Widget used will be ``Slider`` here is an example of how to use it:
```Dart
class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slider(
        value: _currentSliderValue,
        max: 100,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
    );
  }
}
```

At the bottom of the page, a saving button would be displayed to keep the new information, if the user leaves the page without saving, the information wouldn't be saved.

#### 2.2. Skills

In this page would be displayed all the soft skills pre-selected by the user during is registration. All of them would be put inside ``SizedBox`` containing the name of the soft skill and a little cross, if the user wants to remove this soft skill.
Moreover, at the bottom of the page will be another button to change the soft skills selection.
When pressed, it would redirect to another page (profile-add-skills).

On this page, the soft skills would appear under the form of buttons, darkened when selected. If the user clicks on one it would change the shade to selected or unselected depending on the initial state. However, it could not overpass 15 soft skills selected at once.
To do the shading we will use:
```Dart

```
And for the overpass:
```Dart

```
It would follow this logic:
![add_skill_diagram](img/add_skill.png)

<!-- Ranking to do -->

#### 2.3. Certifications

#### 2.4. Notifications

#### 2.5. Jobs Liked

#### 2.6. Logout

### 3. Job Offer Matching

<!-- Explain the logic for displaying job offers based on soft skills. -->

### 4. Swiping Interface

<!-- Describe the Tinder-like swiping interface for browsing job offers. -->

### 5. Notifications

<!-- Detail how notifications are handled within the application (e.g., local notifications). -->

## VII. User Interface Design

### 1. UI Components

<!-- Detail the UI components used and their purposes. -->

### 2. Screen Layouts

<!-- Provide mock-ups and descriptions of each screen layout. -->

### 3. Themes and Styles

<!-- Explain the theming and styling approach (e.g., light/dark mode). -->

## VIII. Integration and Deployment

### 1. Continuous Integration

<!-- Describe the CI pipeline for the front-end (e.g., GitHub Actions, Bitrise). -->

### 2. Deployment Strategy

<!-- Detail the deployment process for the front-end application (e.g., to App Store, Google Play Store). -->

### 3. Environment Configuration

<!-- Explain environment configurations for the front-end (e.g., development, staging, production). -->

## IX. Maintenance and Support

### 1. Logging and Monitoring

<!-- Outline logging and monitoring practices for the front-end (e.g., Firebase Crashlytics). -->

### 2. Bug Reporting and Tracking

<!-- Explain the process for reporting and tracking bugs (e.g., Jira, GitHub Issues). -->

### 3. Updates and Upgrades

<!-- Describe the strategy for front-end application updates and upgrades. -->

## X.  Appendices

### 1. Glossary

<!-- Provide a glossary of terms used in the document. -->

### 2. References

<!-- List references and resources used in the preparation of the document. -->

### 3. Document Revision History

<!-- Include a table documenting the revision history of the technical specification document. -->
