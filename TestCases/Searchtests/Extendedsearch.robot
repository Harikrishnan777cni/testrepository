*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/Search Keywords/BasicsearchKeywords.robot
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Search Keywords/ExtendedsearchKeywords.robot
Variables  ../../PageObjects/Locators.py
Variables  ../../PageObjects/Variables.py
Library  DataDriver  ../../TestData/LoginData.csv
Test Template  Extendedsearchtest
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase

*** Variables ***
${adp_contractname}  International Mark Abrahams

*** Test Cases ***
Extendedsearchtest using ${username} and ${password}

*** Keywords ***

Extendedsearchtest
    [Tags]  Smoke
    [Arguments]  ${SiteUrl}  ${username}  ${password}  ${userrole}  ${adp_contractname}
    Open my url   ${SiteUrl}
    Enter UserName  ${username}
    Enter Password  ${password}
    Click Verify
    Check welcomemessage  ${username}
    ${act_title}  Get Title
    Run Keyword If  '${act_title}' == '${expectedpagetitle_emea}' and '${SiteUrl}' == '${expectedsiteurl_emea}' or '${act_title}' == '${expectedpagetitle_apac}' and '${SiteUrl}' == '${expectedsiteurl_apac}'   Verify successful login  ELSE  Verify unsuccessful login
    Run Keyword If  '${userrole}' == 'piced' or '${userrole}' == 'ebt'  Welcomepagetabscheck_ebtorpiced  ELSE    Welcomepagetabscheck_globaladmin
    Go to images page
    Go to search tab
    Go to extended search tab
    Select contract checkbox
    Click Next button
    clickaddcontractbutton
    selectcontract
    clickaddcontractname
    clickokbutton
    clickFinishbutton
    Page Should Not Contain Element  ${Publications_noresult_lctr}  message=no results found.please try again
    Verify extended search result  ${adp_contractname}
