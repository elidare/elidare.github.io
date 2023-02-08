*** Settings ***

Test Teardown    Close Browser
Library    SeleniumLibrary

*** Variables ***

${BROWSER} =   chrome
${URL} =    https://elidare.github.io/page_under_test
${LOCATOR_USERNAME} =   data:qa-id:username_input
${LOCATOR_PASSWORD} =   data:qa-id:password_input
${LOCATOR_SUBMIT} =   data:qa-id:submit_button
${LOCATOR_LOGOUT} =   data:qa-id:logout_button
${USERNAME} =   hello
${PASSWORD} =   12345

*** Test Cases ***

Index Page Should Be Visible After Successful Login
    [Setup]    Do Successful Login
    Verify That Index Page Is Visible

Login Form Should Be Visible After Successful Logout
    [Setup]    Do Successful Login
    Do Successful Logout
    Verify That Login Page Is Visible

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
    Open Browser To Login Page
    Enter Username  ${USERNAME}
    Enter Password  ${PASSWORD}
    Submit Login Form

Do Successful Logout
    Click Element   ${LOCATOR_LOGOUT}

Verify That Index Page Is Visible
    Wait Until Page Contains    Logout
    #Location Should Be    ${URL}/index.html
    Location Should Be    ${URL}/index_1.html    # Xfail

Verify That Login Page Is Visible
    Wait Until Page Contains    Welcome
    Location Should Be    ${URL}/login.html
