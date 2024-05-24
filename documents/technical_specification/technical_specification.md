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
This is only a simple preview for the first two pages, all the pages would be defined hereunder:
| Names | Path | Descriptions |
| ----- | ---- | ------------ |
| 'logo' | '/logo' ||
| 'splashScreen' | '/splashScreen' ||
| 'login' | '/login' ||
| 'forgetPassword' | '/forgetPassword' ||
| 'typeUserChoice' | '/typeUserChoice' ||
| 'signUpUser' | '/signUpUser' ||
| 'softSkillsChoices' | '/softSkillsChoices' ||
| 'softSkillsRank' | '/softSkillsRank' ||
| 'location' | '/location' ||
| 'profilePicture' | '/profilePicture' ||
| 'checkYourEmail' | '/checkYourEmail' ||
| 'successfully' | '/successfully' ||
| 'homeScreen' | '/homeScreen' ||
| 'jobInfo' | '/jobInfo' ||
| 'skillsCategories' | '/skillsCategories' ||
| 'skillsSelection' | '/skillsSelection' ||
| 'message' | '/message' ||
| 'chat' | '/chat' ||
| 'noMessage' | '/noMessage' ||
| 'profile' | '/profile' ||
| 'personalInformation' | '/personalInformation' ||
| 'updatePassword' | '/updatePassword' ||
| 'updateProfilePicture' | '/updateProfilePicture' ||
| 'settings' | '/settings' ||
| 'jobsLiked' | '/jobsLiked' ||
| 'profileCertification' | '/profileCertification' ||
| 'profileSkills' | '/profileSkills' ||
| 'profileAddSkills' | '/profileAddSkills' ||
| 'profileRankSkills' | '/profileRankSkills' ||
| 'signUpCompany' | '/signUpCompany' ||
| 'profilePictureCompany' | '/profilePictureCompany' ||
| 'companyHomeScreen' | '/companyHomeScreen' ||
| 'noOffer' | '/noOffer' ||
| 'addJobOffer' | '/addJobOffer' ||
| 'addImages' | '/addImages' ||
| 'addSoftSkillsJob' | '/addSoftSkillsJob' ||
| 'SkillsCategoriesCompany' | '/SkillsCategoriesCompany' ||
| 'SkillsSelectionCompany' | '/SkillsSelectionCompany' ||
| 'messageQualifiedCompany' | '/messageQualifiedCompany' ||
| 'messageUnqualifiedCompany' | '/messageUnqualifiedCompany' ||
| 'profileCompany' | '/profileCompany' ||

## V. Data Management

### 1. Data Models

<!-- Define the data models used in the application (e.g., JobOffer, User, SoftSkill). -->

### 2. Local Storage

<!-- Describe any local storage mechanisms used (e.g., shared_preferences, SQLite). -->

## VI. Functional Requirements

### 1. User Authentication

<!-- Describe the user authentication process and integration with back-end services. -->

### 2. User Profile Management

<!-- Detail how users can manage their profiles (e.g., update soft skills, personal info). -->

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
