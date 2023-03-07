*** Settings ***

Library    SeleniumLibrary
Resource   common.resource
Test Setup    Open Browser To Login Page
Test Teardown    Close Browser
Test Template   Error Block Is Visible When Using Incorrect Credentials

*** Variables ***

${USERNAME} =   hello
${PASSWORD} =   12345

*** Test Cases ***

Index Page Should Be Visible After Successful Login
    [Template]    None
    Do Successful Login    ${USERNAME}    ${PASSWORD}
    Verify That Index Page Is Visible

Login Form Should Be Visible After Successful Logout
    [Template]    None
    Do Successful Login    ${USERNAME}    ${PASSWORD}
    Do Successful Logout
    Verify That Login Page Is Visible

Negative: Empty login Empty password    ${EMPTY}    ${EMPTY}
Negative: Empty login Correct password    ${EMPTY}    ${PASSWORD}
Negative: Correct login Empty password    ${USERNAME}    ${EMPTY}
Negative: Correct login Incorrect password    ${USERNAME}    adsads
Negative: Incorrect login Correct password    adsads    ${PASSWORD}

*** Keywords ***

Verify That Index Page Is Visible
    Wait Until Page Contains    Logout
    Location Should Be    ${URL}/index.html
    Title Should Be    A page with content

Verify That Login Page Is Visible
    Wait Until Page Contains    Welcome
    Location Should Be    ${URL}/login.html
    Title Should Be    Just a page to open

Verify That Error Block Is Visible
    Element Should Be Visible    ${LOCATOR_ERROR}

Error Block Is Visible When Using Incorrect Credentials
    [Arguments]    ${username}    ${password}
    Enter Username  ${username}
    Enter Password  ${password}
    Submit Login Form
    Verify That Error Block Is Visible
