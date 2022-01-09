*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Search Keywords/BasicsearchKeywords.robot
Resource  ../../Resources/Folders creation Keywords/FeaturefolderKeywords.robot
Variables  ../../PageObjects/Variables.py
Library  DataDriver  ../../TestData/FeaturefolderLoginData.csv
Test Template  Featurefoldercreation
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase

*** Test Cases ***

Featurefoldertestwithcsv using ${username} and ${password}

*** Keywords ***

Featurefoldercreation
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
    Go to images page
    Go to my folder tab
    Go to fixed folder
    Open Context Menu for fixed folder
    Select create featurefolder option
    ${featurefoldername_input}  Input featurefolder name and click finish button
    #Click finish button
    Verify feature folder creation  ${featurefoldername_input}
