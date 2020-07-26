*** Settings ***
Documentation  Login through web portal
Resource  ../Resources/Data/LoginData.robot
Resource  ../Resources/common.robot
Resource  ../Resources/login_resource.robot

Test Setup  Open Browser To Base URL
Test Teardown  End Test


*** Test Cases ***
Existing User can View Details
    [Documentation]  As an existing user, I can view my details
    [Tags]  Smoke
    Navigate to Login Page
    Submit Existing User Credentials  ${BASE_USER}
    User Can View Details and Signout  ${BASE_USER}

Invalid Login Scenarios
    [Template]  Verify Multiple Login Failure Cases
    ${UNREGISTERED_USER}
    ${INVALID_PASSWORD}
    ${BLANK_CREDENTIALS}

