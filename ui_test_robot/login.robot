*** Settings ***

Library    Browser

*** Variables ***

${URL} =    https://elidare.github.io/page_under_test
${LOCATOR_USERNAME} =   [data-qa-id="username_input"]
${LOCATOR_PASSWORD} =   [data-qa-id="password_input"]
${LOCATOR_SUBMIT} =   [data-qa-id="submit_button"]
${LOCATOR_LOGOUT} =   [data-qa-id="logout_button"]
${USERNAME} =   hello
${PASSWORD} =   12345

*** Test Cases ***

Welcome Page Should Be Visible After Successful Login
    [Setup]    Do Successful Login
    Verify That Welcome Page Is Visible
    [Teardown]    Do Successful Logout

Login Form Should Be Visible After Successful Logout
    [Setup]    Do Successful Login
    Do Successful Logout
    Verify That Login Page Is Visible

*** Keywords ***

Open Browser To Login Page
    New Browser    headless=${FALSE}
    New Page    ${URL}/login.html

Enter Username
    [Arguments]    ${username}
    Fill Text   css=${LOCATOR_USERNAME}   ${username}

Enter Password
    [Arguments]    ${password}
    Fill Secret  css=${LOCATOR_PASSWORD}   $password

Submit Login Form
    Click   css=${LOCATOR_SUBMIT}

Do Successful Login
    Open Browser To Login Page
    Enter Username  ${USERNAME}
    Enter Password  ${PASSWORD}
    Submit Login Form

Do Successful Logout
    Click   css=${LOCATOR_LOGOUT}

Verify That Welcome Page Is Visible
    Get Text    body    contains    Logout
    Get Url    Should Be    ${URL}/welcome.html

Verify That Login Page Is Visible
    Get Text    body    contains    Welcome
    Get Url    Should Be    ${URL}/login.html
