# Tinder-like reqruitment app - Test Plan

<details>
<summary> Table of Contents </summary>

- [Tinder-like reqruitment app - Test Plan](#Tinder-like-reqruitment-app---Test-Plan)
    - [Product Analysis](#1-product-analysis)
        - [Overview](#12-overview)
    - [Strategy](#2-strategy)
        - [First Steps](#21-first-steps)
        - [Automation testing](#22-automation-testing)
    - [Test Criteria](#3-test-criteria)
        - [App Evaluation](#31-app-evaluation)
        - [Suspension Criteria](#32-suspension-criteria)
        - [Exit Criteria](#33-exit-criteria)
    - [Test Schedules/Estimations](#4test-schedulestimations)
    - [Glossary](#5-glossary)

</details>


---


 
## 1 Product Analysis

### 1.2 Overview

The project aims to create a "Tinder style" recruitment application that 
matches companies with jobseekers using the Flutter software, which will 
be functional on android, desktop and tablets.

The app will ensure the anonymization of the user and will focus on the
soft skills, instead of solely on diplomas and proffesional experience.
There will be a "matching" proccess that will occur between the user and the 
company, which then the company will be able to contact the user via email.

## 2. Strategy

Due to the fact that the project needs to be completed in a short time period, we will be implementing a regression testing proccess in order for us to be able to catch bugs while we are in developement of the app.

### 2.1 First steps

The first step is to identify the impact and risk of the latest code change.That can be achieved by performing conduct code review sessions by leveraging a version control system such as git to compare the differences between the old and new code. After that, the QA lead will decide which changes should be extensively tested and which could bare with adequate testing. The determining factor will be the impact of the core features that will be affected the most.

### 2.2 Automation testing 

Automation testing is a type of testing which uses specialized tools and software to execute predefined test cases automatically.This will be key to our testing proccess considering the time constraint and the fact that manual testing takes a long time and is less effective due to human error. However manual testing will be implemented if neccessary.


## 3. Test Criteria

Establishing test criteria is crucial to guarantee the quality of our program before it is released. This represents some standards to which our application must conform to before being sent to customers.

### 3.1 App evaluation

Here will be presented the most important assessments on how to evaluate the app:

    1. Interface Intuitiveness - The interface should work as expected by the user with no significant errors or overly complex commands that would sway the usage of the app.

    2. App performance - The speed at which pages load and tasks will be executed will be at an acceptable rate.

    3. App security - The app should be secure and non breachable by any third party, information about the user will remain unknown to anyone unless agreed by the user.

    4. App relevance to company needs - The app will be constructed as per it has been described by the company We Are Evolution.


### 3.2 Suspension Criteria

Suspencion criteria are established to define conditions under which testing activities are temporarily halted.Such conditions are:

    1. Critical Bug Threshold - If a critical bug is encountered to which the app becomes non-functional,
    a temporary suspension is put in place on testing and implementation until the bug has been resolved.

    2. Recource/Environment issues - If for whatever reason there is an issue with the software or environment 
    that is to be utilized, the testing will be suspended until the issues have been resolved.

### 3.3 Exit Criteria 

Before the app can be considered finished, certain milestones need to have been met by the team.
This criteria ensures that the app meets the required quality standards before reaching the consumer.

    1. Test Case Coverage - A minimum test case coverage of 80% of all the added features and functionalities must be completed with success.

    2. Bug Resolution Coverage - At least 90% of bugs must be addressed and resolved before the app is considered finished.

    3. Documentation Completeness - Comprehensive documentation, including test plans, test cases, test results, functional specifications, and technical specifications, must be finalized and reviewed for completeness. Documentation should be easily understandable and accessible to all team members, ensuring a clear understanding of the testing process and results.





## 4.Test Schedules/Estimations

| Task | Start Date | End Date | Duration |
| ---- | ---------- | -------- | -------- |
| ---- | ---------- | -------- | -------- |
| ---- | ---------- | -------- | -------- |

## 5. Glossary

| Term | Definition | Source |
| ---- | ---------- | ------ |
| **Automation Testing** | Automation testing is the process of automating the execution of test cases through scripts and/or specialized tools. | [Wikipedia](https://en.wikipedia.org/wiki/Test_automation)
| **Dart** | Dart is a programming language optimized for cross-platform applications. It is developed by Google and is used to create mobile, desktop, server and web applications.| [Wikipedia](https://en.wikipedia.org/wiki/Dart_(programming_language))
| **Flutter Software**| Flutter is an open-source UI software development kit created by Google. It can be used to develop cross platform applications from a single codebase for the web, Fuchsia, Android, iOS, Linux, macOS, and Windows. | [Wikipedia](https://en.wikipedia.org/wiki/Flutter_(software))
| **Git** | Git is a distributed version control system that tracks versions of files. It is often used to control source code by programmers collaboratively developing software. | [Wikipedia](https://en.wikipedia.org/wiki/Git)
| **Regression Testing** | Regression testing is re-running functional and non-functional tests to ensure that previously developed and tested software still performs as expected after a change.   | [Wikipedia](https://en.wikipedia.org/wiki/Regression_testing)    


| Created on | Last Update | 
| ---------- | ---------- |
| 05/17/2024 | 05/22/2024 |