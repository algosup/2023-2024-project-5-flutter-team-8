# Functional Specifications 

<details>
<summary>

## Table of content </summary>

- [Functional Specifications](#functional-specifications)
  - [Table of content ](#table-of-content-)
  - [A) Document Control](#a-document-control)
    - [1) Document Information](#1-document-information)
    - [2) Document History](#2-document-history)
    - [3) Document Approval](#3-document-approval)
  - [B) Introduction](#b-introduction)
    - [1) Glossary](#1-glossary)
    - [2) Project Overview](#2-project-overview)
    - [3) Project Definition](#3-project-definition)
      - [➭ Vision](#-vision)
      - [➭ Objectives](#-objectives)
      - [➭ Scope](#-scope)
      - [➭ Deliverables](#-deliverables)
    - [4) Project Organisation](#4-project-organisation)
      - [➭ Project Representatives](#-project-representatives)
      - [➭ Stakeholders](#-stakeholders)
      - [➭ Project Roles](#-project-roles)
      - [➭ Project Reviewers](#-project-reviewers)
    - [5) Project Plan](#5-project-plan)
      - [➭ Retroplanning](#-retroplanning)
      - [➭ Milestones](#-milestones)
      - [➭ Dependencies](#-dependencies)
      - [➭ Assumptions/Constraints](#-assumptionsconstraints)
  - [C) Functional Requirements](#c-functional-requirements)
    - [1) Soft Skills Evaluation](#1-soft-skills-evaluation)
      - [➭ User Registration](#-user-registration)
        - [➭ Candidate Registration](#-candidate-registration)
        - [➭ Company Registration](#-company-registration)
      - [➭ Candidate Management](#-candidate-management)
      - [➭ Candidate Anonymity](#-candidate-anonymity)
      - [➭ Soft Skills Assessment](#-soft-skills-assessment)
      - [➭ Job Creation](#-job-creation)
    - [2) Job Applications](#2-job-applications)
      - [➭ Job Matching](#-job-matching)
      - [➭ Localization](#-localization)
    - [3) Language Support](#3-language-support)
      - [➭ Language Options](#-language-options)
    - [4) Device Compatibility](#4-device-compatibility)
      - [➭ Supported Devices](#-supported-devices)
      - [➭ Cross-Platform Compatibility](#-cross-platform-compatibility)
    - [5) Target Audience](#5-target-audience)
      - [➭ Job Seekers](#-job-seekers)
      - [➭ Companies](#-companies)
    - [6) Candidate Privacy](#6-candidate-privacy)
      - [➭ Confidentiality Measures](#-confidentiality-measures)
      - [➭ Data Visibility](#-data-visibility)
      - [➭ Soft Skill Compatibility](#-soft-skill-compatibility)
  - [D) Non-Functional Requirements](#d-non-functional-requirements)
    - [1) User Interface Design](#1-user-interface-design)
      - [➭ Visual Design](#-visual-design)
      - [➭ Branding](#-branding)
      - [➭ Accessibility](#-accessibility)
    - [2) Security](#2-security)
      - [➭ Candidate Privacy](#-candidate-privacy)
      - [➭ Data Encryption](#-data-encryption)
    - [3) Performance](#3-performance)
      - [➭ Responsiveness](#-responsiveness)
      - [➭ Load Time](#-load-time)
    - [4) Reliability](#4-reliability)
      - [➭ System Stability](#-system-stability)
      - [➭ Error Handling](#-error-handling)
    - [5) Usability](#5-usability)
      - [➭ Intuitive Navigation](#-intuitive-navigation)
      - [➭ User Feedback](#-user-feedback)
    - [6) Localization](#6-localization)
      - [➭ Language Support](#-language-support)
      - [➭ Cultural Adaptation](#-cultural-adaptation)
    - [7) Compatibility](#7-compatibility)
      - [➭ Cross-Device Compatibility](#-cross-device-compatibility)
      - [➭ Browser Compatibility](#-browser-compatibility)
    - [8) Support and Maintenance](#8-support-and-maintenance)
      - [➭ Technical Support](#-technical-support)
      - [➭ Software Updates](#-software-updates)
  
</details>

## A) Document Control

### 1) Document Information

**Title**: Functional Specifications.

**Author(s)**: Thomas PLANCHARD.

**Document ID/Number**: <!-- TODO -->

**Version**: v0.1.

**Date of Creation**: 05/16/24.

**Last Updated**: 05/21/24.

**Status**: Draft.

**Confidentiality Level**: Public.

### 2) Document History

|Version|	Date|	Author|	Description of Changes|	Reason for Change|
|-------|-----|-------|-----------------------|------------------|
|       |     |       |                       |                  |

<!-- TODO -->

### 3) Document Approval

|Approver Name	|Title	|Approval Date	|Signature	|Comments |
|---------------|-------|---------------|-----------|---------|
|               |       |               |           |         |

<!-- TODO -->

## B) Introduction

### 1) Glossary

<!-- TODO -->

### 2) Project Overview

This project aims to create a Tinder-like recruitment app valuing soft skills rather than hard skills.

The client is the company "We Are Evolution.", a creative employer branding agency. Our contact point is Lilou Jourdannaud, the communication intern.

### 3) Project Definition

#### ➭ Vision

The vision of the "Adopte Un Candidat" Project is to rehearse and improve the current job recruitment, by focussing more on a behavioral aspect than an actual technical one. It would principally help companies find good employees with great mental and behavior, increasing the work life for all of them. Like this a good atmosphere would be present in the company and the work amount would increase since humans work better in a sain environment.

This application would then help companies find new employee basing their research on different kinds of "Soft skills". It would allow the companies to select what matters the most within a predefined soft skills list, according to what they want the employee to be.
<!-- To rehearse -->

#### ➭ Objectives

**Anonymization of candidates and companies**: To avoid discrimination in hiring, candidates and 
companies are anonymized on the platform. This allows us to focus on candidates' skills and 
potential, rather than their origin, gender, age, etc.

**Valuing soft skills**: Instead of focusing solely on diplomas and professional experience, the concept 
emphasizes soft skills, i.e. the behavioral and relational skills of candidates. This makes it possible to recognize and evaluate skills such as communication, teamwork, creativity, problem-solving, etc.

**Priority given to the human aspect**: The concept emphasizes the human aspect of recruitment, 
recognizing that each candidate has unique talents and skills to offer. It seeks to give each individual 
the opportunity to showcase his or her skills, regardless of background or academic credentials.

**Matching between candidates and companies**: The "matching" process enables candidates and 
companies to connect and find an ideal match. Candidates can express their preferences in terms of 
companies and positions, and companies can search for candidates who match their cultural and 
organizational needs.

**Using an application**: The entire recruitment process takes place on a dedicated application. This 
facilitates interaction between candidates and companies, offering features such as messaging, 
personalized profiles, etc.

**Process**: In our approach, we do not have tests, quizzes, or games. Instead, candidates will have the 
opportunity to select their soft skills from a provided list, while recruiters will choose the desired 
skills from the same list. The "match" will occur when there is a 50% overlap of soft skills between 
the candidate and the company. Our concept is inspired by the functionality of the "Tinder" 
application for recruitment. There is no document or defined skills matrix.

#### ➭ Scope

This project should be done using Flutter and be compatible with all types of devices.

This implementation should be only targeting the front-end at first and should offer an interface to candidates, and companies but also "We are evolution." as an administrator.

#### ➭ Deliverables

The main deliverable is the source code of the application. In addition, to ensure we stay on the right track, we will submit multiple mock-ups and prototypes to the client.

Additional documents will be given to the client:

- Functional Specification
- Technical Specification
- Test Plan
- User Manual
- Management Planning & Weekly reports

In addition, a presentation of our work will be done to the client as a 15-minute long presentation.

### 4) Project Organisation

#### ➭ Project Representatives

| Full Name        | Occupation               | Links                                                               |
| ---------------- | ------------------------ | ------------------------------------------------------------------- |
| Antoine PREVOST  | Project manager          | [LinkedIn](https://www.linkedin.com/in/antoine-prevost-dev/)        |
| Thomas PLANCHARD | Program manager          | [LinkedIn](https://linkedin.com/in/thomas-planchard-461782221/)     |
| Maxime THIZEAU   | Tech lead                | [LinkedIn](https://linkedin.com/in/maxime-thizeau-0b311a293)        |
| Quentin CLEMENT  | Senior software engineer | [LinkedIn](https://linkedin.com/in/quentin-cl%C3%A9ment-939110221/) |
| Pavlo PRENDI     | Quality assurance        | [LinkedIn](https://www.linkedin.com/in/pavlo-prendi-674777309/)     |
| Arthur LEMOINE   | Technical writer         | [LinkedIn](https://www.linkedin.com/in/arthur-lemoine-4b9782221/)   |

#### ➭ Stakeholders

| Role            | Representative                        | Expectation                                                            |
| --------------- | ------------------------------------- | ---------------------------------------------------------------------- |
| Client          | Lilou Jourdannaud (We Are Evolution.) | Finished project meeting requirements                                  |
| School director | Franck JEANNIN (ALGOSUP)              | Clear documentation and management based on the skills learnt in class |

#### ➭ Project Roles

**Project manager**: A Project Manager (PM) is responsible for planning, executing, and closing projects. They ensure that the project meets its objectives on time and within budget. The PM coordinates the efforts of the team and manages resources to ensure smooth project progression.

**Program manager**: A Program Manager oversees multiple related projects, aligning them with the strategic goals of the organization. They ensure that projects within a program are coordinated and meet broader business objectives.

**Tech lead**: A Tech Lead is a senior technical expert who provides technical direction for a project or team. They ensure that the technical aspects of the project are aligned with best practices and organizational standards.

**Software engineer**: A Software Engineer designs, develops, tests, and maintains software applications. They work on the implementation of features and functionalities according to project requirements.

**Quality assurance**: A Quality Assurance professional ensures that software products meet quality standards before they are released. They identify defects and issues through systematic testing and validation.

**Technical writer**: A Technical Writer creates documentation that explains technical information clearly and concisely. They produce manuals, guides, and other materials that help users understand and use products effectively.

#### ➭ Project Reviewers

<!-- TODO -->

### 5) Project Plan

#### ➭ Retroplanning

**End Goal and Deadline**:

Launch of the new "Adopte un Candidat" application by June 21, 2024.

**Key Milestones**:

- Final Testing completed by June 14, 2024.
- Final Product codebase completed by June 12, 2024.
- Functional Specification completed by May 24, 2024.

**Task Breakdown**:

- Correcting codebase product from June 12 to June 14, 2024.
- Testing codebase product from June 12 to June 14, 2024.
- Implementing Nice-to-have features from June 10 to June 12, 2024.
- Implementing core features from June 7 to June 12, 2024.
- Reviewing Functional Specification from May 23 to May 24, 2024.
- Defining Functional Specification from May 14 to May 23, 2024.
- Creating the Mockup from May 14 to May 21, 2024.

**Critical Path**:

- Core feature development must be completed before final testing.
- Mockup must be completed before Implementing Core features.

**Timeline Visualization**:

<!-- Include a Gantt chart or similar timeline to visualize the backward planning.
Ensure it shows task durations and dependencies. -->

#### ➭ Milestones

| Date       | Time   | Milestones                        |
| ---------- | ------ | --------------------------------- |
| 05/13/2024 | 9 A.M. | Project kick-off with the client  |
| 05/24/2024 | 5 P.M. | Functional Specification delivery |
| 06/07/2024 | 5 P.M. | Technical Specification delivery  |
| 06/07/2024 | 5 P.M. | Test Plan delivery                |
| 06/14/2024 | 5 P.M. | Final product codebase delivery   |
| 06/14/2024 | 5 P.M. | User Manual Delivery              |
| 06/21/2024 | 9 A.M. | Final Presentation Pitch          |

#### ➭ Dependencies

<!-- TODO -->

**Task Dependencies**:

- Final Testing cannot start until Core Feature Development is complete.
- Nice-to-have features cannot start until Core Feature Development is complete.
- Core Feature Development cannot start until the Mockup is approved.

**Resource Dependencies**:

- QA Team must be available for continuous testing from June 7 to June 14, 2024.

**Critical Path Analysis**:

<!-- Explain the critical path and its impact on the project timeline.
Example: "Delays in critical path tasks will delay the overall project completion." -->

#### ➭ Assumptions/Constraints

<!-- To complete -->

**Assumptions**:

For this project, the team will assume the application will be free when released so the creation of a business plan is not useful.
To simplify the application there will be no admin account, assuming all the counts created would be authentical and totally legal.

**Constraints**:

However, there are some constraints as well in this project, they are:

**Risk Factors**:

<!-- Mention potential risks associated with assumptions and constraints.
Example: "Risk of resource unavailability due to overlapping projects." -->

**Mitigation Plans**:

<!-- Provide plans to address and mitigate constraints and risks.
Example: "Contingency plans for delays in critical tasks, such as allocating additional resources." -->

## C) Functional Requirements

### 1) Soft Skills Evaluation

#### ➭ User Registration

To register for the application, it would differ according to the state of the user (Company or Candidate).

##### ➭ Candidate Registration

There will be five different steps to register a new candidate account.

The first one would be to register an e-mail account, a password and a full name, which will be hidden later on.

The second step would be to select a total of fifteen "soft skills" from a list of forty of them.

Once they have selected these 15 "soft skills" defining them, they should organize them from the best to the worst. The first one would be the "soft skills" they master the most, and so on.

Next, the user will have to select his location and a range around it to define the possible company near him.

Finally, they should select an avatar among twelve animals, defining their mentality and how they see themselves.

Once all these steps are completed, the user will receive an e-mail in his mailbox to confirm his registration.

##### ➭ Company Registration

To register as a company it is way simple.

The first step would be nearly the same as for the users, the company would need to register an e-mail account, a password, the name of the company and the company registration number (SIRET number).

After this, they would have to give their Logo to the application.

Finally, they would receive an e-mail in his mailbox to confirm their registration.

#### ➭ Candidate Management

A list would be provided on the communication page for the company. This page would contain all the matching users who are interested in the job offer provided.
They would be able to click on each profile to see the redirected e-mail, but also the certification and a more detailed view of the soft skills selected by the user.

#### ➭ Candidate Anonymity

According to the requirements and the fact that the application is based solely on "soft skills", the candidate dashboard on the company side would be anonymized to prefer impartiality. \
Therefore, only the avatar, the ID registration number and the soft skills of the user would be visible. \
It would also be a redirected mail to communicate between the two if the company is interested in the user profile. \
However, the e-mail provided would not be the user's personal e-mail to certify the anonymity once again.

#### ➭ Soft Skills Assessment

To assess the level of soft skills mentioned by the user, the company would be able to create its own certification as a way to certify the user's claims.
The certification could be a simple multiple-choice questionnaire where the company sets a percentage of wanted answers to give the certification.
Of course, a user with a certification would benefit from one who doesn't have it.

#### ➭ Job Creation

Another requested feature is to create job offers. \
To create a job offer, the company should register the type of contract they need and also the contract start date (according to the type of contract the end date could be requested).
The next step would be to register the job's title and a short description of it. \
After this, the company should register the location of the workplace and it could add some images of it. It is not mandatory but highly recommended, since it could help users to accept the job offer. \
Finally, the company needs to register the researched soft skills which will not be visible on the user side.

### 2) Job Applications

#### ➭ Job Matching

As this app is a "Tinder-like" application, a match system was needed.
This system is defined as follows:
- Home page with "bubbles" containing companies' logos.
- When clicked, a pop-up page will appear, with the company's logo, the company's name, a starting date, the job name, the company's location and a little job description. To see some images you would be able to swipe to the right.
- To apply or deny the job offer, click on the according button.
If the company likes the user's profile, there will be a match.

#### ➭ Localization
<!-- ? -->

### 3) Language Support

#### ➭ Language Options

Since the targeted audience for this application is France, it is meant to be in the French language at first.
However, to facilitate the expansion of the application in foreign countries, a language setting was added.
Then, at the launching of the product, there would only be English and French language.
Other languages could be implemented afterward, depending on which country would use the application.

To change the language option, access to the settings will be created on the settings page.

### 4) Device Compatibility

#### ➭ Supported Devices

Since the programming language for this project is Flutter. The application would be supported by a large amount of devices.
The supported devices would be:
- MacOS
- Windows
- Linux
- Android
- Ios
- Chrome

#### ➭ Cross-Platform Compatibility

<!-- TODO -->

### 5) Target Audience

#### ➭ Job Seekers

**Perona 1 - Warrick Ryder**:

![Persona 1 - Warrick Ryder](img/warrick_ryder.png)

**Perona 2 - Sham'a Aline**:

![Perona 2 - Sham'a Aline](img/sham'a_aline.png)

#### ➭ Companies

**Perona 3 - SUBLIMINAL**:

![Perona 3 - SUBLIMINAL](img/subliminal.png)

### 6) Candidate Privacy

#### ➭ Confidentiality Measures

#### ➭ Data Visibility

#### ➭ Soft Skill Compatibility

## D) Non-Functional Requirements

### 1) User Interface Design

#### ➭ Visual Design

<!-- Insert Mockup 
Logo, color pallet, page template, avatars -->

#### ➭ Branding

#### ➭ Accessibility

### 2) Security

#### ➭ Candidate Privacy

#### ➭ Data Encryption

### 3) Performance

#### ➭ Responsiveness

#### ➭ Load Time

### 4) Reliability

#### ➭ System Stability

#### ➭ Error Handling

### 5) Usability

#### ➭ Intuitive Navigation

#### ➭ User Feedback

### 6) Localization

#### ➭ Language Support

#### ➭ Cultural Adaptation

### 7) Compatibility

#### ➭ Cross-Device Compatibility

#### ➭ Browser Compatibility

### 8) Support and Maintenance

#### ➭ Technical Support

#### ➭ Software Updates
