*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/PageObjects/register_page.robot
Resource  ../Resources/Data/LoginData.robot


*** Keywords ***
Open Browser To Base URL
    Open Browser  ${BASE_URL}  ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains  index page

End Test
    Close Browser

Insert Test User
    Open Browser To Base URL
    Select Registration Form
    Enter User Details  ${BASE_USER}
    Submit Registration Form
    Close Browser