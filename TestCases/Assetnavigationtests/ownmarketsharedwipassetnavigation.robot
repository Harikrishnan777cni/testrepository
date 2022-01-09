*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Assetnavigation Keywords/ownmarketSharedwipnavigationkeywords.robot
Resource  ../../Resources/Datamanager.robot
Variables  ../../PageObjects/Variables.py
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase
Library  DataDriver  ../../TestData/ownmarketsharedwipassetnavigationLoginData.csv
Test Template  Own market sharedwip asset navigation using csv file


*** Variables ***
#${Browser}  chrome
#${SiteUrl}  https://emea-staging.cnidam.com
#${user}  uk-glamour-pictureeditor@condenast.com
#${pwd}  Monday12!
${sharedwipinputcsv}  /Users/hsreekum/PycharmProjects/DAMrobotAutomationframeworktwo/TestData/sharedwipownmarket.csv


*** Test Cases ***
Own market sharedwip asset navigation using csv file

*** Keywords ***
Own market sharedwip asset navigation using csv file
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
    ownmarketSharedwipnavigationkeywords.Own market sharedwipassetnavigation using the csvfile  ${marketfolders}



