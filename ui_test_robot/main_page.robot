*** Settings ***

Library    SeleniumLibrary
Resource   common.resource
Test Setup    Open Browser To Index Page
Test Teardown    Close Browser

*** Variables ***
# For this page I don't store locators in common.resource as I want to try different ways
${LOCATOR_MENU_PAGE_1} =    //li[contains(text(), "Page 1")]
${LOCATOR_MENU_DROPDOWN_1} =    //li[contains(text(), "Page 1")]/ul[@class="dropdown"]
${LOCATOR_MENU_PAGE_1_2} =    css:[href="#page_1_2"]
${LOCATOR_CONTENT_PAGE_1_2} =    id:page_1_2
${LOCATOR_MENU_PAGE_2} =    css:[href="#page_2"]
${LOCATOR_CONTENT_PAGE_2} =    id:page_2
${LOCATOR_BACK_TO_TOP} =    css:#page_2 [href="#"]


*** Test Cases ***
Click On Menu Without Hover Should Change Content
    Click Element    ${LOCATOR_MENU_PAGE_2}
    Verify That Page Is Scrolled Down
    

Click On Menu With Hover Should Change Content
    Mouse Over    ${LOCATOR_MENU_PAGE_1}
    Wait Until Element Is Visible    ${LOCATOR_MENU_DROPDOWN_1}
    Click Element    ${LOCATOR_MENU_PAGE_1_2}
    Verify That Page Is Scrolled Down


Click On Back To Top Should Scroll To Menu
    Click Element    ${LOCATOR_MENU_PAGE_2}
    Click Element    ${LOCATOR_BACK_TO_TOP}
    Verify That Page Is Scrolled To Top

*** Keywords ***
Verify That Page Is Scrolled Down
    # Robot framework doesn't have verifying that the element is scrolled into view, so I check that the page is at least scrolled
    # For more strict checks I'd use some math magic and Get Vertical Position of the element that I need to check
    ${scrollTop} =    Execute Javascript    return (document.documentElement.scrollTop || document.body.scrollTop)
    Should Not Be Equal As Numbers    ${scrollTop}    0    "scrollTop should not be 0, but it is ${scrollTop}"


Verify That Page Is Scrolled To Top
    ${scrollTop} =    Execute Javascript    return (document.documentElement.scrollTop || document.body.scrollTop)
    Should Be Equal As Integers   ${scrollTop}    0    "scrollTop should be 0, but it is ${scrollTop}"
