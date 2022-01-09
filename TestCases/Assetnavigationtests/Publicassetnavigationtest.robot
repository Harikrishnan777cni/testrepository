*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Assetnavigation Keywords/ownmarketpublicassetnavigationkeywords.robot
Variables  ../../PageObjects/Variables.py
Resource  ../../Resources/Datamanager.robot
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase
Library  DataDriver  ../../TestData/ownmarketpublicassetnavigationLoginData.csv
Test Template  Should select own market folders with set of data

*** Variables ***
#${Browser}  chrome
#${SiteUrl}  https://emea-staging.cnidam.com
#${user}  uk-wired-piced@condenast.com
#${pwd}  Tuesday2020!*
#${userrole}  piced
${ownmarketinputcsv}  /Users/hsreekum/PycharmProjects/DAMrobotAutomationframeworktwo/TestData/ownmarketpublicassetnavigation.csv

*** Test Cases ***
Should select own market folders with set of data using ${username} and ${password}

*** Keywords ***
Should select own market folders with set of data
    [Tags]  Smoke
    [Arguments]  ${SiteUrl}  ${username}  ${password}  ${userrole}
    ${ownmarketfolders}  Datamanager.Get CSV Data  ${ownmarketinputcsv}
    Open my url   ${SiteUrl}
    Enter UserName  ${username}
    Enter Password  ${password}
    Click Verify
    Sleep  7s
    ${act_title}  Get Title
    Run Keyword If  '${act_title}' == '${expectedpagetitle_emea}' and '${SiteUrl}' == '${expectedsiteurl_emea}' or '${act_title}' == '${expectedpagetitle_apac}' and '${SiteUrl}' == '${expectedsiteurl_apac}'   Verify successful login  ELSE  Verify unsuccessful login
    Run Keyword If  '${userrole}' == 'piced' or '${userrole}' == 'ebt'  Welcomepagetabscheck_ebtorpiced  ELSE    Welcomepagetabscheck_globaladmin
    Go to images page
    Ownmarket publicassetnavigation using the csvfile  ${ownmarketfolders}


