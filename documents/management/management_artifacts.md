# 2023 - 2024 Project-5 Flutter Team-8 - Management Artifacts

This document aims to centralize all the management artifact links and resources listed below:

- Tasks & schedule
- RACI Matrix
- Risks & Assumptions
- Key Performance Indicators
- Weekly reports

## Tasks & schedule

You can view the breakdown of all the tasks we've identified for the duration of the project following [this link](https://docs.google.com/spreadsheets/d/1QFKKn1Zu7k-iphcHswhBO5TsPfcmz9KxaEGjEYsmUTM/edit?usp=sharing).

It has been created using Google Sheets, ensuring a good comprehension already known by everyone, but also as a modular tool, which can easily implement metrics in a clear manner. Conseuqently, the client can track with ease the challenges and achievements done during the project.

## RACI Matrix

The RACI matrix of this project is as follows:

| Name                     | Project Manager | Program Manager | Technical Leader | Software engineer | Quality assurance | Technical Writer | Client | Stakeholders |
| ------------------------ | --------------- | --------------- | ---------------- | ----------------- | ----------------- | ---------------- | ------ | ------------ |
| Project kick-off         | I               | I               | I                | I                 | I                 | I                | R      | C            |
| Project charter          | R               | A               | C                | C                 | C                 | C                | I      | I            |
| Schedule creation        | R               | C               | C                | C                 | C                 | C                | /      | I            |
| Functional specification | A               | R               | C                |                   | C                 | /                | C      | I            |
| Technical specification  | A               | C               | R/A              | I                 | C                 | /                | C      | I            |
| Coding process           | A               | I               | R                | R/A               | C                 | /                | /      | /            |
| Testing planification    | A               | /               | C                | C                 | R/A               | I                | /      | /            |
| Usage instructions       | A               | C               | C                | C                 | I                 | R/A              | I      | I            |

Legend:

| Letter | Full name   | Description                                     |
| ------ | ----------- | ----------------------------------------------- |
| R      | Responsible | Eecutes the task or activity                    |
| A      | Accountant  | Ultimately answerable for the task's completion |
| C      | Consulted   | Provides input and advice on the task           |
| I      | Informed    | Kept updated on progress and decisions          |
| /      | /           | No interaction with this role for this task     |

## Risks & Assumptions

| ID  | Description                                                                    | Consequence                                                       | Impact   | Likelihood | Mitigation/Avoidance                                                                |
| --- | ------------------------------------------------------------------------------ | ----------------------------------------------------------------- | -------- | ---------- | ----------------------------------------------------------------------------------- |
| 1   | Flutter is a laguage to which we are not yet used to.                          | Development pace might be hindered                                | High     | Medium     | Ask for help to the other team members                                              |
| 2   | The client might want to change /add requirements                              | We might need to change how the solution is developed             | Medium   | Low        | Validate every step of the project with the client, to ensure the solution fits him |
| 3   | We might create a clone of an already exisiting solution and infringe a patent | The client couldn't develop their solution based on our prototype | High     | Low        | Check for any patent and find our unique selling point (USP)                        |
| 4   | Misinterpretation of the project                                               | Incorrect implementation of the software                          | Critical | Medium     | Regular communication with the client to understand their needs, and stick to them. |
| 5   | Team member leaving                                                            | Tasks left to the remaining members without any assignee          | High     | Unlikely   | Sharing the tasks among the remaining team members.                                 |

## Key Performance Indicators

### Definition of our KPIs

In order for the client to follow our project's milestones, several KPIs quantitatively measurable were defined. You can find in the following list those ones along with their calculation.

#### Documents

This section includes the following KPIs:

- **Functional specifications**
- **Technical specifications**
- **Test Plan**
- **User Manual**

It was decided the KPI calculation for the progression of the documents of this project would solely rely on this function:

> *(current_number_of_sections / total_number_of_sections) \* 100*

In this calculation, this is the meaning of the mentionned variables:

- ***current_number_of_sections***: The number of sections which has its content completely done.
- ***total_number_of_sections***: The number of already defined categories in the skeleton. This number can evolve over weeks.

#### Design

This section includes the following KPIs:

- **Mock-ups**
- **User journey roadmap**

The percentage indicated for those KPIs is processed using this function:

> *(current_number_of_pages_designed / total_number_of_pages_to_design ) \* 100*

In this function, this is the meaning of the indicated variables:

- ***current_number_of_pages_designed***: The number of pages already prototyped
- ***total_number_of_pages_to_design***: The nulber of pages that were planned to be designed during the project analysis.

#### Development

This section includes the following KPIs:

- **Logged out interfaces**
- **User interfaces**
- **Company interfaces**

As development can take a long time, we also added an approximation to take into account progress made on the unfinished pages in the calculation for this category. For each of those pages, we will take into account the proportion of the elements already realised to the ones which should be present, leaving us with the following formula:

> *((current_number_of_fully_coded_pages + sum_unfinished_pages_advancements)/ total_designed_pages ) \* 100*

In this function, this is the meaning of the written variables:

- ***current_number_of_fully_coded_pages***: The number of pages in the app which have been finished
- ***sum_unfinished_pages_advancements***: The sum of each unfinished page advancement. The advancement of each page can go from 0 to 1.
- ***total_designed_pages***: The total number of pages defined during the project analysis and designed.

#### Human Resources

This section includes the following KPIs along with their definition:

- **Unjustified absence time:** Number of manhours which were not worked on the project by a member.
- **Overtime:** The total number of manhours done on a member's personal time.

#### Mood

This KPI is calculated by doing the average of the percentage given by the members at the end of each week.

### Link to the project's KPIs

You can see our project's KPIs which were explained above following [this link](https://docs.google.com/spreadsheets/d/13r3LjiBo7af3gUG_U1R8BDZ1rG9yWM4tQpzGxaaGdE4/edit?usp=sharing).

## Weekly reports

The weekly reports' folder can be found following [this link](/documents/management/weekly_reports/).

You can directly access the reports individually following the below bullet points:

- [Access Report for Week 1](/documents/management/weekly_reports/week1.md)
- [Access Report for Week 2](/documents/management/weekly_reports/week2.md)
- [Access Report for Week 3](/documents/management/weekly_reports/week3.md)
- [Access Report for Week 4](/documents/management/weekly_reports/week4.md)
- [Access Report for Week 5](/documents/management/weekly_reports/week5.md)
- [Access Report for Week 6](/documents/management/weekly_reports/week6.md)
- [Access Cumulative file for all 6 weeks](/documents/management/weekly_reports/cumulative.md)
