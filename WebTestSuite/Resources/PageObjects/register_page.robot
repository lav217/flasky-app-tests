*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${REGISTER_LINK}  Register
${REGISTER_USER_ID}  id:username
${REGISTER_PASSWORD_ID}  id:password
${REGISTER_FNAME_ID}  id:firstname
${REGISTER_LNAME_ID}  id:lastname
${REGISTER_PHONE_ID}  id:phone
${REGISTER_BUTTON}  Register
${LOGIN_TITLE}  Log In - Demo App
${REGISTERED_MESSAGE}  already registered


*** Keywords ***
Select Registration Form
    Click Link  ${REGISTER_LINK}

Enter User Details
    [Arguments]  ${User_Profile}
    Input Text  ${REGISTER_USER_ID}  ${User_Profile.Username}
    Input Text  ${REGISTER_PASSWORD_ID}  ${User_Profile.Password}
    Input Text  ${REGISTER_FNAME_ID}  ${User_Profile.Firstname}
    Input Text  ${REGISTER_LNAME_ID}  ${User_Profile.Lastname}
    Input Text  ${REGISTER_PHONE_ID}  ${User_Profile.Phone}

Submit Registration Form
    Click Button  ${REGISTER_BUTTON}

Login Page Should Be Open
    Title Should Be  ${LOGIN_TITLE}

User Already Registered Message Should Be Displayed
    Page Should Contain  ${REGISTERED_MESSAGE}