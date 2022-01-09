*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Datamanager.robot
Resource  ../../Resources/Assetnavigation Keywords/differentmarketpublicassetnavigationkeywords.robot
Variables  ../../PageObjects/Locators.py
Variables  ../../PageObjects/Variables.py
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase
Library  DataDriver  ../../TestData/DifferentmarketpublicassetnavigationLoginData.csv
Test Template  DifferentmarketPublicassetnavigationtest

*** Variables ***
#${markettestinput}  UK
${marketinputcsv}  /Users/hsreekum/PycharmProjects/DAMrobotAutomationframeworktwo/TestData/differentmarketpublicassetnavigation.csv
#${Browser}  chrome
#${SiteUrl}  https://emea-staging.cnidam.com
#${user}  uk-glamour-pictureeditor@condenast.com
#${pwd}  Monday12!
#${userrole}  piced

*** Test Cases ***
DifferentmarketPublicassetnavigationtest using ${username} and ${password}

*** Keywords ***
DifferentmarketPublicassetnavigationtest
    [Tags]  Smoke
    [Arguments]  ${SiteUrl}  ${username}  ${password}  ${userrole}
    ${marketfolders}  Datamanager.Get CSV Data  ${marketinputcsv}
    Open my url   ${SiteUrl}
    Enter UserName  ${username}
    Enter Password  ${password}
    Click Verify
    Check welcomemessage  ${username}
    ${act_title}  Get Title
    Run Keyword If  '${act_title}' == '${expectedpagetitle_emea}' and '${SiteUrl}' == '${expectedsiteurl_emea}' or '${act_title}' == '${expectedpagetitle_apac}' and '${SiteUrl}' == '${expectedsiteurl_apac}'   Verify successful login  ELSE  Verify unsuccessful login
    Run Keyword If  '${userrole}' == 'piced' or '${userrole}' == 'ebt'  Welcomepagetabscheck_ebtorpiced  ELSE    Welcomepagetabscheck_globaladmin
    Go to images page
    Differentmarketpublicassetnavigationkeywords.Differentmarketpublicassetnavigation using the csvfile  ${marketfolders}


