*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${LOCATOR_USERNAME} =   data:qa-id:username_input
${LOCATOR_PASSWORD} =   data:qa-id:password_input
${LOCATOR_SUBMIT} =   data:qa-id:submit_button
${LOCATOR_LOGOUT} =   data:qa-id:logout_button
${LOCATOR_ERROR} =    data:qa-id:submit_error
${BROWSER} =   chrome
${URL} =    https://elidare.github.io/page_under_test

*** Keywords ***

Open Browser To Login Page
    Open Browser    ${URL}/login.html    ${BROWSER}

Enter Username
    [Arguments]    ${username}
    Input Text   ${LOCATOR_USERNAME}   ${username}

Enter Password
    [Arguments]    ${password}
    Input Password  ${LOCATOR_PASSWORD}   ${password}

Submit Login Form
    Click button   ${LOCATOR_SUBMIT}

Do Successful Login
    [Arguments]    ${username}    ${password}
    Enter Username  ${username}
    Enter Password  ${password}
    Submit Login Form

Do Successful Logout
    Click Element   ${LOCATOR_LOGOUT}