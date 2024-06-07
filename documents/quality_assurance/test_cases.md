# Overview

The purpose of this document is to catalog the tests that will be performed to ensure Adopte un Candidat's application needs.

## Priority

Test priorities are indicated following the color-code below:

| Color | Priority        |
| ----- | --------------- |
| 🟨     | Low priority    |
| 🟧     | Medium priority |
| 🟥     | High priority   |

## 1. Login Function Test

| ID               | T01                                                                                                                                                                                                              |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Make sure the user is able to login successfully                                                                                                                                                                 |
| Step(s)          | **1.** On the login page, enter the following e-mail in the e-mail field: quentin.clement@algosup.com<br> **2.** Enter the following password in the password field: 12345<br>**3.** Click on the "Login" button |
| Expected Result  | User successfully logged in and redirected to another page.                                                                                                                                                       |
| Priority         | 🟥                                                                                                                                                                                                                |

## 2. Login page - "Show password"

| ID               | T02                                                                                                                                            |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Make sure the user can view the password he typed                                                                                              |
| Step(s)          | **1.** On the login page, enter a random string in the password field<br>**2.** Click on the icon situated on the right of the password field. |
| Expected Result  | The string should be displayed as a readable string rather than dots.                                                                           |
| Priority         | 🟨                                                                                                                                              |

## 3. Login page - "Remember me"

| ID               | T03                                                                                                                                                                                                                                                                                                                  |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Make sure the user is automatically logged back in when the remember me field is ticked and the application is restarted                                                                                                                                                                                             |
| Step(s)          | **1.** On the login page, enter the e-mail and the password as explained in the 2 first steps of the [test case n°1](#1-login-function-test).<br>**2.** Tick the "Remember me" checkbox under the form and then on the "Login button"<br>**3.** Wait to be redirected on another page, close the app and restart it. |
| Expected Result  | You should be by default on a page different from the login one from now on when restarting the app.                                                                                                                                                                                                                 |
| Priority         | 🟨                                                                                                                                                                                                                                                                                                                    |

## 4. Login Page - Sign up option

| ID               | T04                                                                                                                         |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Make sure the user can easily be redirected to the registration page from the login page.                                   |
| Step(s)          | **1.** On the login page, check for a text saying "Don't have an account yet? Sign up"<br>**2.** Click on the sign-up text. |
| Expected Result  | Verify you are redirected to the sign-up page.                                                                               |
| Priority         | 🟨                                                                                                                           |

## 5. Login Page - Forgot Password option

| ID               | T05                                                                                           |
| ---------------- | --------------------------------------------------------------------------------------------- |
| Test Description | Verify that you are able to change your password                                              |
| Step(s)          | **1.** On the login page, search for the text "Forgot Password?" <br>**2.** Click on the text |
| Expected Result  | You should be redirected to a page to requesting your e-mail to reset your password.           |
| Priority         | 🟨                                                                                             |

## 6. Forgot Password Page - Login Option

| ID               | T06                                                                     |
| ---------------- | ----------------------------------------------------------------------- |
| Test Description | Verify that the "Back to Login" redirects to the login page             |
| Step(s)          | **1.** On the forgot password page, click on the "BACK TO LOGIN" button |
| Expected Result  | You should be back on the login screen.                                  |
| Priority         | 🟨                                                                       |

## 7. Forgot Password Page - Form Submission

| ID               | T07                                                                                                                                                                                                                        |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Verify the on-app process after forgot password form submission                                                                                                                                                            |
| Step(s)          | **1.** On the forgot password page, in the e-mail field, fill-in your e-mail and click on the button "RESET PASSWORD"<br>**2.** You should be redirected on a page on which you should press the button "OPEN YOUR E-MAIL" |
| Expected Result  | The app should prompt your operating system to open e-mails with a specific app, or open your favourite e-mail app.                                                                                                         |
| Priority         | 🟨                                                                                                                                                                                                                          |

## 8. Company/Job Seeker Selection Page

| ID               | T08                                                                                                                                  |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| Test Description | Verify that clicking an option sends you to the related option form                                                                  |
| Step(s)          | **1.** Click on "Company" option and verify first expected result **2.** Click "Job Seeker" option and verify second expected result |
| Expected Result  | **1.** The form contains the "Company name" input field. **2.** The form contains the "Full Name" input field.                       |
| Priority         | 🟥                                                                                                                                    |

## 9. Register Page - "Show password"

| ID               | T09                                                                                                                                                         |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Make sure the user can view the password he typed                                                                                                           |
| Step(s)          | **1.** On the first registration page, enter a random string in the password field<br>**2.** Click on the icon situated on the right of the password field |
| Expected Result  | The string should be displayed as a readable string rather than dots.                                                                                        |
| Priority         | 🟨                                                                                                                                                           |

## 10. Soft Skills Selection Page

| ID               | T10                                                                                                                                                                                                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Verify the user is able to select 15 soft skills                                                                                                                                                                                                           |
| Step(s)          | **1.** On the soft skills selection page, choose one soft skill and the "CONTINUE" button, and check first expected result<br>**2.** Choose fifteen soft skills and the "CONTINUE" button, and check second expected result<br>**3.**Choose 16 soft-skills |
| Expected Result  | **1.** An error indicating not enough choices were done should be triggered<br>**2.** We should go on the next page result<br>**3.** Not more than 15 soft skills should be selected at once.                                                              |
| Priority         | 🟥                                                                                                                                                                                                                                                          |

## 11. Soft Skills Ranking Page

| ID               | T11                                                                                                                             |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Verify that the user can rank their soft skills according to their preferences                                                  |
| Step(s)          | **1.** On the soft skills ranking page, rank the soft skills from strongest to wickest<br>**2.** Click on the "CONTINUE" button |
| Expected Result  | The soft skills are displayed according to the given rank.                                                                       |
| Priority         | 🟥                                                                                                                               |

## 12. Location Selection Page

| ID               | T12                                                                                                                                             |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Verify that you can select your preferred job location                                                                                          |
| Step(s)          | **1.** On the location selection page,Search for a location<br>**2.** Adjust the slider for the distance radius of research                     |
| Expected Result  | **1.** A location can be effectively searched<br>**2.** The slider should be movable and modify the radius value indicated but, also on the map. |
| Priority         | 🟥                                                                                                                                               |

## 13. Profile picture selection Page

| ID               | T13                                                                                                                                              |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| Test Description | Verify that you are able to select a profile picture                                                                                             |
| Step(s)          | **1.** On the profile picture selection page, select one of the images of the animals by clicking on it<br>**2.** Click on the "CONTINUE" button |
| Expected Result  | The animal clicked is set as the user's profile picture.                                                                                          |
| Priority         | 🟥                                                                                                                                                |

## 14. Job Seeker Home Screen - Bubble Interactions & Popups

| ID               | T14                                                                             |
| ---------------- | ------------------------------------------------------------------------------- |
| Test Description | Verify that when you click on a "job bubble", the company's job listing appears |
| Step(s)          | **1.** On the job seeker homepage, click on one of the displayed bubbles        |
| Expected Result  | The company's job listing should appear in a small popup.                        |
| Priority         | 🟥                                                                               |

## 15. Job Seeker Home Screen Popups- Company Pictures Carousel

| ID               | T15                                                                                                                                     |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Make sure that you can swap between the company's carousel images                                                                       |
| Step(s)          | **1.** On the job seeker homepage, when a job popup is opened, swipe through the images from left to right, and then from right to left |
| Expected Result  | You can swipe between the company's images.                                                                                              |
| Priority         | 🟥                                                                                                                                       |

## 16. Job Seeker Home Screen Popups - Apply/Deny function

| ID               | T16                                                                                                                                                                  |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Verify that when you click "apply" the user has applied successfully and when you click "deny" the user has denied the request successfully                          |
| Step(s)          | **1.** Click on the "APPLY" button<br>**2.** Click on the "DENY" button                                                                                              |
| Expected Result  | **1.** The "APPLY" button is not clickable anymore but "DENY" is clickable<br>**2.** The "DENY" button is not clickable anymore and "APPLY" becomse clickable again. |
| Priority         | 🟥                                                                                                                                                                    |

## 17. Messages page (Company/Jobseeker)

| ID               | T17                                                                                                                                                                                                                                                                                                                          |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Verify that the messaging aspect of the app works as expected                                                                                                                                                                                                                                                                |
| Step(s)          | **1.** Test messaging user from company side by writing any text in the message field and clicking on the send button and check the expected result<br>**2.** Test messsaging a company from the user side by writing any text as a reply in the message field and clicking on the send button and check the expected result |
| Expected Result  | On both sides, the result should be the adddition of a message on the interface in which you are writing, but not on the company side as there is no back-end.                                                                                                                                                               |
| Priority         | 🟥                                                                                                                                                                                                                                                                                                                            |

## 18. Messages Page Features (Company/Jobseeker)

| ID               | T18                                                                                                                                                                                                                                                                                                                                                                  |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Verify that the additional functions in the messages page work as expected                                                                                                                                                                                                                                                                                           |
| Step(s)          | **1.** Test the search bar and check the first expected result<br>**2.** Test the "CREATE NEW MESSAGE" button and check the second expected result<br>**3.** Click on the "SETTINGS" button and check the third expected result<br>**4.** Test the delete function message function by long-clicking on a specfic message and click on the "Delete message" option   |
| Expected Result  | **1.** The search bar displays messages containing content from the user or the user profile itself if you are in the conversation's list page.<br> **2.** An empty message page should appear, prompting the user to message.<br>**3.** This should display a dropdown menu containing some options.<br>**4.** The message clicked should dissapear from you screen. |
| Priority         | 🟥                                                                                                                                                                                                                                                                                                                                                                    |

## 19. Personal Information page (Company/Jobseeker)

| ID               | T19                                                                                                                                                                          |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Verify that you can change and save the personal information of the user and the company successfully                                                                                        |
| Step(s)          | **1.** Change the fullname & Click on "SAVE" button<br>**2.** Change the password & Click on "SAVE" button<br>**3.** Change the profile picture & Click on the "SAVE" button |
| Expected Result  | The displayed information should change by the one provided in all cases.                                                                                              |
| Priority         | 🟨                                                                                                                                                                            |

## 20. Notifications page

| ID               | T20                                                                                                                                                       |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Verify that the notification options work as expected                                                                                                     |
| Step(s)          | **1.** Verify "Notifications" button can be disabled by clicking on it.<br>**2.**Reclick on the disabled option and test for all the buttons on the page |
| Expected Result  | The button should be colored in grey.                                                                                                               |
| Priority         | 🟨                                                                                                                                                         |

## 21. Logout function

| ID               | T21                                                                                          |
| ---------------- | -------------------------------------------------------------------------------------------- |
| Test Description | Verify that the job seeker/company is able to logout out of their account                    |
| Step(s)          | **1.** From the profile, click on the "LOGOUT" button<br>**2.** Confirm by clicking on "YES" |
| Expected Result  | The user comes back on the homepage for logged out users.                              |
| Priority         | 🟧                                                                                            |

## 22. Liked Jobs Page

| ID               | T22                                                                                                                                 |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Verify that when you like a job it shows up on your "Liked Jobs" page                                                               |
| Step(s)          | **1.** Go on the candidate homepage to like a job<br>**2.** Go back on the "Liked Jobs" page and ensure it is displayed in the list |
| Expected Result  | The job previously liked should be addded to the "Liked Jobs" page.                                                                 |
| Priority         | 🟧                                                                                                                                   |

## 23. My skills page

| ID               | T23                                                                                                                                                                                                                                                              |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Verify that all the skills that the user filled in when registering show up and can be changed                                                                                                                                                                   |
| Step(s)          | **1.** Compare the skills filled in during the registration process are showing up<br>**2.** Change the order of the skills and save<br>**3.** Change the soft skills present in the list by clicking on "EDIT" and saving                                      |
| Expected Result  | **1** The soft skills should be the same<br>**2.** The order of the soft-skills should be changed accordingly to the newly provided order<br>**3.** The soft-skills prsent in the list should be changed accordingly to the ones provided in the new submission. |
| Priority         | 🟧                                                                                                                                                                                                                                                                |

## 24. Company Registration Page - Information

| ID               | T24                                                                                                                                                             |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Verify that a company can create an account                                                                                                                     |
| Step(s)          | **1.** Enter company name, the company registration number, the e-mail used for verifications and the wanted password<br>**2.** Click on the "CONTINUE" button. |
| Expected Result  |  A company should be created with the provided information.                                                                                                |
| Priority         | 🟥                                                                                                                                                               |

## 25. Company Profile Picture Page

| ID               | T25                                                                                                                               |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Verify that the company can add their company logo                                                                                |
| Step(s)          | **1.** Upload a picture on the "Profile Picture" page from the gallery or the camera.<br>**2.** Go on the Profile of the company. |
| Expected Result  | The profile of the company should display the submitted logo as their profile picture on their profile page.                       |
| Priority         | 🟥                                                                                                                                 |
## 26. Company home page

| ID               | T26                                                                                                                               |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Verify that the companys' home page has all the prerequisites i.e search bar, job offers they created, create new job offer button                                                                                |
| Step(s)          | **1.** Click on a job offer .<br>**2.** Test the search bar <br>**3** Click on the "add new job offer" button. |
| Expected Result  | The company can see and interact with their added job offers, search for them and be able to create new ones through the home page.                       |
| Priority         | 🟥                                                                                                                                 |

## 27. Add job offer function

| ID               | T27                                                                                                                                   |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| Test Description | Verify that the company can effectively add a new job offer with all their available information                                                                                |
| Step(s)          | **1.** Add a job title  .<br>**2.** Add the company name <br>**3** Add the start date and end date, <br>**4.** Add the type of contract, <br>**5.** Add the location, <br>**2.** Add a description of the job offer, <br>**6.** Add images, <br>**7.** Add the soft skills required for the job |
| Expected Result  | The company is able to create a job offer according to the soft skills that they need, with all the information of the job offer required.                       |
| Priority         | 🟥   



Here you can find the [spreadsheet](https://docs.google.com/spreadsheets/d/1jggZ1MM17cirvH-KzJUpDIp5knKfm5Y54keJeAQ5Rl4/edit#gid=0) of these test cases and the reports.
