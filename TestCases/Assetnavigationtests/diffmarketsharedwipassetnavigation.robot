*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Assetnavigation Keywords/diffmarketSharedwipnavigationkeywords.robot
Resource  ../../Resources/Datamanager.robot
Variables  ../../PageObjects/Variables.py
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase
Library  DataDriver  ../../TestData/diffmarketsharedwipnavigationLoginData.csv
Test Template  Should select correct sharedwip folders with set of data

*** Variables ***
${Browser}  chrome
${SiteUrl}  https://emea-staging.cnidam.com
${user}  uk-glamour-pictureeditor@condenast.com
${pwd}  Monday12!
${sharedwipinputcsv}  /Users/hsreekum/PycharmProjects/DAMrobotAutomationframeworktwo/TestData/sharedwipdifferentmarket.csv


*** Test Cases ***
Should select correct sharedwip folders with set of data using ${username} and ${password}

*** Keywords ***
Should select correct sharedwip folders with set of data
    [Tags]  Smoke
    [Arguments]  ${SiteUrl}  ${username}  ${password}  ${userrole}

    ${marketfolders}  Datamanager.Get CSV Data  ${sharedwipinputcsv}
    Open my url   ${SiteUrl}
    Enter UserName  ${username}
    Enter Password  ${password}
    Click Verify
    Check welcomemessage  ${username}
    ${act_title}  Get Title
    Run Keyword If  '${act_title}' == '${expectedpagetitle_emea}' and '${SiteUrl}' == '${expectedsiteurl_emea}' or '${act_title}' == '${expectedpagetitle_apac}' and '${SiteUrl}' == '${expectedsiteurl_apac}'   Verify successful login  ELSE  Verify unsuccessful login
    Run Keyword If  '${userrole}' == 'piced' or '${userrole}' == 'ebt'  Welcomepagetabscheck_ebtorpiced  ELSE    Welcomepagetabscheck_globaladmin
    Sharedwipnavigationkeywords.Go to images page
    diffmarketSharedwipnavigationkeywords.Diff market sharedwipassetnavigation using the csvfile  ${marketfolders}



