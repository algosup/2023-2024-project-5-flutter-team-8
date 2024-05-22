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
This document is meant to explain how to create the 

### 2. Scope

<!-- Define the scope of the front-end project and what the document will cover. -->

### 3. Definitions, Acronyms, and Abbreviations

<!-- Provide definitions for any technical terms, acronyms, and abbreviations used in the document. -->

## II. Conventions

### 1. Coding Standards

<!-- Describe the coding standards and style guidelines to be followed (e.g., Dart/Flutter coding conventions). -->

### 2. Naming Conventions

<!-- Define naming conventions for variables, classes, methods, and other identifiers. -->
```
branches: kebab-case
folder: snake_case
file: snake_case
following the flutter naming convention
function: camelCase
class: PascalCase
widget: PascalCase
```

### 3. Commenting and Documentation

<!-- Outline how code should be commented and documented, including requirements for inline comments and documentation comments. -->

## III. System Overview

### 1. System Architecture

<!-- Provide an overview of the front-end architecture, including diagrams (e.g., component diagrams). -->

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
| | | \---weekly_report_2.md
| | | \---weekly_report_3.md
| | | \---weekly_report_4.md
| | | \---weekly_report_5.md
| | | \---weekly_report_6.md
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

### 2. Technology Stack

<!-- List and describe the technologies and frameworks used (e.g., Flutter, Dart). -->

### 3. Key Components

<!-- Describe the key components of the front-end (e.g., UI components, state management). -->

## IV. Application Architecture

### 1. Design Patterns

<!-- Discuss the design patterns employed in the application (e.g., MVVM, BLoC). -->

### 2. State Management

<!-- Describe the state management approach used (e.g., Provider, Riverpod, BLoC). -->

### 3. Navigation

<!-- Detail the navigation strategy (e.g., Navigator 2.0, named routes). -->

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
