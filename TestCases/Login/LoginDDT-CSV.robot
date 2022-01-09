*** Settings ***
Library   SeleniumLibrary
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Variables  ../../PageObjects/Variables.py
Library  DataDriver  ../../TestData/LoginData.csv
Test Template  ValidLogin
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase


*** Test Cases ***
Logintestwithcsv using ${username} and ${password}

*** Keywords ***

Valid Login
    [Tags]  Smoke
    [Arguments]  ${SiteUrl}  ${username}  ${password}  ${userrole}
    Open my url   ${SiteUrl}
    Enter UserName  ${username}
    Enter Password  ${password}
    Click Verify
    Check welcomemessage  ${username}
    ${act_title}  Get Title
    Run Keyword If  '${act_title}' == '${expectedpagetitle_emea}' and '${SiteUrl}' == '${expectedsiteurl_emea}' or '${act_title}' == '${expectedpagetitle_apac}' and '${SiteUrl}' == '${expectedsiteurl_apac}'   Verify successful login  ELSE  Verify unsuccessful login
    Run Keyword If  '${userrole}' == 'piced' or '${userrole}' == 'ebt'  Welcomepagetabscheck_ebtorpiced  ELSE    Welcomepagetabscheck_globaladmin




