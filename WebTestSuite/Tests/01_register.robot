*** Settings ***
Documentation  Register through web portal
Library  String
Library  Collections
Resource  ../Resources/common.robot
Resource  ../Resources/register_resource.robot
Resource  ../Resources/Data/LoginData.robot

Suite Setup  Insert Test User
Test Setup  Open Browser To Base URL
Test Teardown  End Test


*** Variables ***
&{VALID_USER}  Username=validuser  Password=test123  Firstname=sdfso  Lastname=wewf  Phone=3092


*** Test Cases ***
A New User can Register
    [Documentation]  As a new user to the website, I can register
    [Tags]  Smoke
    ${ranuser}=  Generate Random String  10  [LETTERS][NUMBERS]
    Set to Dictionary  ${VALID_USER}  Username=${ranuser}
    Navigate to Registration Page
    Submit User Profile  ${VALID_USER}
    Registration is Successful

Existing User cannot Register
    [Documentation]  As an existing user to the website, I cannot register
    Navigate to Registration Page
    Submit User Profile  ${VALID_USER}
    User Cannot Register
