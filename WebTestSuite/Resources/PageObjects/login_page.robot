*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LOGIN_LINK}  Log In
${LOGIN_USER_ID}  id:username
${LOGIN_PASSWORD_ID}  id:password
${LOGIN_BUTTON}  Log In
${DETAILS_TABLE_ID}  xpath://table[@id='content']
${LOGOUT_LINK}  Log Out
${LOGOUT_TITLE}  index page - Demo App


*** Keywords ***
Select Log In Form
    Click Link  ${LOGIN_LINK}

Enter Credentials
    [Arguments]  ${User_Credentials}
    run keyword unless  '${User_Credentials.Username}' == '#BLANK'  Input Text  ${LOGIN_USER_ID}  ${User_Credentials.Username}
    run keyword unless  '${User_Credentials.Password}' == '#BLANK'  Input Text  ${LOGIN_PASSWORD_ID}  ${User_Credentials.Password}

Submit Log In Form
    Click Button  ${LOGIN_BUTTON}

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Page Should Contain  ${ExpectedErrorMessage}

View Details
    [Arguments]  ${User_Profile}
    Table Cell Should Contain  ${DETAILS_TABLE_ID}  2  2  ${User_Profile.Username}
    Table Cell Should Contain  ${DETAILS_TABLE_ID}  3  2  ${User_Profile.Firstname}
    Table Cell Should Contain  ${DETAILS_TABLE_ID}  4  2  ${User_Profile.Lastname}
    Table Cell Should Contain  ${DETAILS_TABLE_ID}  5  2  ${User_Profile.Phone}

User Can Log Out
    Click Link  ${LOGOUT_LINK}
    Title Should Be  ${LOGOUT_TITLE}
