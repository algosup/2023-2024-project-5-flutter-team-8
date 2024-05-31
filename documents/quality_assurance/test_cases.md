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
| Test Description | Verify that the certifications function work as expected  |
|Step(s) | 1.test all the specification options, 2. create a "dummy" test to complete 3. see the results 4.check certifications page if it gets added after |
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

## . Personal information page

| ID | T07 |
| -- | --- |
| Test Description | Verify that you can change and save the personal information of the user successfully |
|Step(s) | 1.change the fullname, 2.change the password, 3. change the profile picture |
| Expected Result | Information is changed and saved successfully |
| Priority | 🟨 |

## . Notifications page

| ID | T07 |
| -- | --- |
| Test Description | Verify that the notification options work as expected  |
|Step(s) | 1.test "notifications", 2. test "new job alert" 3. test "message from company" 4.test "new matches" 5.test "application rejection" 6/ test "new certification available" |
| Expected Result | The notifications are able to be adjusted accordingly|
| Priority | 🟨 |

## . Logout function

| ID | T07 |
| -- | --- |
| Test Description | Verify that the user/company is able to logout out of their account |
|Step(s) | 1.click logout from the profile page, 2. click yes |
| Expected Result | The user/company can successfully log out |
| Priority | 🟧 |

## . Jobs Liked page
 
| ID | T07 |
| -- | --- |
| Test Description | Verify that when you like a job it shows up on your "jobs liked" page |
|Step(s) | 1. like a job, 2. check if it's added to the "jobs liked" page |
| Expected Result | Liked jobs are added to the "jobs liked" page |
| Priority | 🟥 |

## . My skills page

| ID | T07 |
| -- | --- |
| Test Description | Verify that all the skills that the user has show up and can be changed |
|Step(s) | 1. check if all the skills show up, 2. change the around |
| Expected Result | The skills are present and can be changed accordingly |
| Priority | 🟧 |

### **Company side**

## . Create an Account screen

| ID | T07 |
| -- | --- |
| Test Description | Verify that the company can create an account |
|Step(s) | 1.Enter company name, 2.enter company registration number, 3.enter e-mail, 4. enter password |
| Expected Result | The company can successfully create an account |
| Priority | 🟥 |

## . Profile picture screen 

| ID | T07 |
| -- | --- |
| Test Description | Verify that the company can add their company logo |
|Step(s) | 1. Add the logo, 2. check result |
| Expected Result | The company logo has been added |
| Priority | 🟥 |

## . Ranking screen

| ID | T07 |
| -- | --- |
| Test Description |  |
|Step(s) |  |
| Expected Result |  |
| Priority | 🟥 |


## . Settings

| ID | T08 |
| -- | --- |
| Test Description | Verify that the settings work as expected  |
|Step(s) |  |
| Expected Result |  |
| Priority | 🟨 |






| Created on | Updated on | 
| ---------- | ---------- |
| 05/18/2024 | 05/31/2024 | 