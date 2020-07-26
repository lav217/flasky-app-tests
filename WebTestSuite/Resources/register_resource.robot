*** Settings ***
Resource  PageObjects/register_page.robot


*** Keywords ***
Navigate to Registration Page
    Select Registration Form

Submit User Profile
    [Arguments]  ${User_Profile}
    Enter User Details  ${User_Profile}
    Submit Registration Form

Registration is Successful
    Login Page Should Be Open

User Cannot Register
    User Already Registered Message Should Be Displayed