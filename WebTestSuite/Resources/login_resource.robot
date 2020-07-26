*** Settings ***
Resource  PageObjects/login_page.robot


*** Keywords ***
Verify Multiple Login Failure Cases
    [Arguments]  ${User_Credentials}
    Navigate to Login Page
    Perform Login Operation With  ${User_Credentials}
    Verify Login Page Error Message Is  ${User_Credentials.ExpectedErrorMessage}

Submit Existing User Credentials
    [Arguments]  ${User_Credentials}
    Perform Login operation With  ${User_Credentials}

Navigate to Login Page
    Select Log In Form

Perform Login operation With
    [Arguments]  ${User_Credentials}
    Enter Credentials  ${User_Credentials}
    Submit Log In Form

Verify Login Page Error Message is
    [Arguments]  ${ExpectedErrorMessage}
    Verify Error Message  ${ExpectedErrorMessage}

User Can View Details and Signout
    [Arguments]  ${User_Profile}
    View Details  ${User_Profile}
    User Can Log Out
