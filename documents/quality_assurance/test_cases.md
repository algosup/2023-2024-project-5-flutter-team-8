# Overview

The purpose of this document is to catalog the tests that will be performed ranked by priority.

- low priority 🟨 
- medium priority 🟧
- high priority 🟥

## . Login the app (main function)

| ID | T01 |
| -- | --- |
| Test Description | Make sure the user is able to login successfully, |
|Step(s) | 1. enter email, 2. enter password, 3. click login |
| Expected Result | User successfully logged in |
| Priority | 🟥 |

## . Login the app (additional functions)

| ID | T01 |
| -- | --- |
| Test Description | Make sure the additional functions on the screen work as expected |
|Step(s) | 1.test "show password" button, 2. test "remember me" button, 3. test "sign up button" |
| Expected Result | All functions work as would be expected  |
| Priority | 🟧 |

## . Forgot password screen

| ID | T02 |
| -- | --- |
| Test Description | Verify that you are able to change your password |
|Step(s) | 1. Enter your email, 2. click reset password |
| Expected Result | An email gets sent to the user with the instuctions on how to change their password |
| Priority | 🟨 |

## . Forgot password screen (additional functions)

| ID | T02 |
| -- | --- |
| Test Description | Verify that the "back to login" button works as expected |
|Step(s) | 1.click "back to login" |
| Expected Result | you are back at the login screen |
| Priority | 🟨 |

## . Check your email for password reset screen 

| ID | T07 |
| -- | --- |
| Test Description | Verify that an email was sent to the user with the password reset instructions |
|Step(s) | 1. click on "open your email" |
| Expected Result | The email has been sent successfully |
| Priority | 🟨 |

## . Check your email for password reset screen (addidtional functions)

| ID | T07 |
| -- | --- |
| Test Description | Verify that the additional buttons on the page work as expected |
|Step(s) | 1. test the "resend" button, 2. test the "back to login button" |
| Expected Result | The buttons work as expected |
| Priority | 🟨 |

## . Success message screen(for psasword reset)

| ID | T07 |
| -- | --- |
| Test Description | Verify that the password hsa been sucessfully changed |
|Step(s) | 1. login with new password |
| Expected Result | The user is able to login with their new password  |
| Priority | 🟨 |

## . Company/Job seeker selection screen

| ID | T03 |
| -- | --- |
| Test Description | Verify that clicking the adjacent will send you to the correct page |
|Step(s) | **1.** click company, **2.** click job seeker  |
| Expected Result | When clicking "Company" the company's page loads. When clicking "Job Seeker" the user's page loads  |
| Priority | 🟥 |

### **User Side**

## . Create an account screen

| ID | T04 |
| -- | --- |
| Test Description | Verify that the user can successfully create an account |
|Step(s) | **1.** enter full name, **2.** enter email, **3.** enter password, **4.** click continue |
| Expected Result | The user has successfully signed in, all their information is saved |
| Priority | 🟥 |

## . Create an account screen (additional functions)

| ID | T04 |
| -- | --- |
| Test Description | Verify that the additional buttons on the page work as expected |
|Step(s) | click the "show password" button, click the "login" button |
| Expected Result | The buttons work as expected |
| Priority | 🟨 |

## . Soft skills selection screen

| ID | T05 |
| -- | --- |
| Test Description | Verify that the user is able to select 1 to 15 soft skills  |
|Step(s) | 1. select 1 to 15 soft skills |
| Expected Result | The selected soft skills are added to your profile |
| Priority | 🟥 |

## . Ranking soft skills screen

| ID | T06 |
| -- | --- |
| Test Description | Verify that the user can rank their soft skills according to thir preferences |
|Step(s) | 1. rank the soft skills from "I believe this is my strongest soft skill" to "I'm not so confident on this soft skill", 2. click continue |
| Expected Result | The soft skills are registered according to their ranks |
| Priority | 🟥 |

## . Location selection screen

| ID | T07 |
| -- | --- |
| Test Description | Verify that you can select your preferred job location |
|Step(s) |  1. Search a location, 2. click on the map, 3. adjust the slider |
| Expected Result | The location I entered is registered and I get job reccommendations from that area |
| Priority | 🟥 |

## . Profile picture selection screen

| ID | T07 |
| -- | --- |
| Test Description | Verify that you are able to select a profile picture |
|Step(s) | 1. select an animal, 2. click continue  |
| Expected Result | The animal clicked is set as the users profile picture |
| Priority | 🟥 |

## . Bubble clicking

| ID | T07 |
| -- | --- |
| Test Description | Verify that when you click on a "job bubble", the company's job listing appears |
|Step(s) | 1. click on a bubble |
| Expected Result | The company's job listing appears in a small window with the option to apply or deny the job |
| Priority | 🟥 |

## . Company picture swapping

| ID | T07 |
| -- | --- |
| Test Description | Make sure that you can swap between the company's images |
|Step(s) | 1. swipe through the images from left to right, and then from right to left  |
| Expected Result | You can swipe between the company's images  |
| Priority | 🟧 |

## . Apply/Deny function

| ID | T07 |
| -- | --- |
| Test Description | Verify that when you click "apply" the user has applied successfully and when you click "deny" the user has denied the request successfully|
|Step(s) | 1.cick "appy", 2. verify that the user has applied. 3.Click "deny" the user has denied the request |
| Expected Result | The app recognises when the user has accepted or denied the  request |
| Priority | 🟥 |

## . Certifications page

| ID | T07 |
| -- | --- |
| Test Description | Verify that in the certifications page the user can jump in a certification, take a quick quiz, and get certifications according to how they did |
|Step(s) | 1.test all the specification options, 2. create a "dummy" test to complete 3. see the results 4.test the search bar  |
| Expected Result | The certifications page and function works as expected |
| Priority | 🟧 | <-----

## . Messages page

| ID | T07 |
| -- | --- |
| Test Description | Verify that the messaging aspect of the app works as expected |
|Step(s) | 1.Test messaging user from company side, 2.vise versa |
| Expected Result | Messaging between the 2 parties works as expected |
| Priority | 🟧 |

## . Messages page(additional functions)

| ID | T07 |
| -- | --- |
| Test Description | Verify that the additional functions in the messages page work as expected |
|Step(s) | 1.test the search bar, 2.test the create new message button 3. test the settings button 4. test the deleting messages function |
| Expected Result | All the additional functions word as expected |
| Priority | 🟥 |

## . Profile page

| ID | T07 |
| -- | --- |
| Test Description | Verify that the profile page and it's functions all work as expected |
|Step(s) | 1.test all the options on the page, 2.test if the a |
| Expected Result |  |
| Priority | 🟥 |

## . Personal information page

| ID | T07 |
| -- | --- |
| Test Description |  |
|Step(s) |   |
| Expected Result |  |
| Priority | 🟥 |

## . Update password (through personal information page)

| ID | T07 |
| -- | --- |
| Test Description |  |
|Step(s) |  |
| Expected Result |  |
| Priority | 🟥 |

## . Update profile picture

| ID | T07 |
| -- | --- |
| Test Description |  |
|Step(s) |   |
| Expected Result |   |
| Priority | 🟥 |

## . Notifications page

| ID | T07 |
| -- | --- |
| Test Description |  |
|Step(s) |   |
| Expected Result |   |
| Priority | 🟥 |

## . Logout function

| ID | T07 |
| -- | --- |
| Test Description |  |
|Step(s) |   |
| Expected Result |   |
| Priority | 🟥 |

## . Jobs Liked page

| ID | T07 |
| -- | --- |
| Test Description |  |
|Step(s) |   |
| Expected Result |   |
| Priority | 🟥 |

## . My certifications page

| ID | T07 |
| -- | --- |
| Test Description |  |
|Step(s) |   |
| Expected Result |   |
| Priority | 🟥 |

## . My skills page

| ID | T07 |
| -- | --- |
| Test Description |  |
|Step(s) |   |
| Expected Result |   |
| Priority | 🟥 |

### **Company side**

| ID | T07 |
| -- | --- |
| Test Description |  |
|Step(s) |   |
| Expected Result |   |
| Priority | 🟥 |

## . Create an Account screen

| ID | T07 |
| -- | --- |
| Test Description |  |
|Step(s) |   |
| Expected Result |   |
| Priority | 🟥 |

## . Profile picture screen 

| ID | T07 |
| -- | --- |
| Test Description |  |
|Step(s) |   |
| Expected Result |   |
| Priority | 🟥 |

## . Ranking screen

| ID | T07 |
| -- | --- |
| Test Description |  |
|Step(s) |   |
| Expected Result |   |
| Priority | 🟥 |


## . Settings

| ID | T08 |
| -- | --- |
| Test Description | Verify that the settings work as expected  |
|Step(s) |   |
| Expected Result |   |
| Priority | 🟨 |






| Created on | Updated on | 
| ---------- | ---------- |
| 05/18/2024 | 05/24/2024 | 