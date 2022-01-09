*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Assetnavigation Keywords/Publicationsnavigationkeywords.robot
Resource  ../../Resources/Datamanager.robot
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase
Library  DataDriver  ../../TestData/PublicationnavigationLoginData.csv
Test Template  Should select correct publication folders with set of data

*** Variables ***
${publicationinputcsv}  /Users/hsreekum/PycharmProjects/DAMrobotAutomationframeworktwo/TestData/Publications.csv

*** Test Cases ***
Should select correct publication folders with set of data using ${username} and ${password}

*** Keywords ***
Should select correct publication folders with set of data

    [Tags]  Smoke
    [Arguments]  ${SiteUrl}  ${username}  ${password}  ${userrole}

    ${publicationfolders}  Datamanager.Get CSV Data  ${publicationinputcsv}
    Open my url   ${SiteUrl}
    Enter UserName  ${user}
    Enter Password  ${pwd}
    Click Verify
    Sleep  7s
    ${act_title}  Get Title
    Run Keyword If  '${act_title}' == 'Staging EMEA | Welcome to AEM'  Verify successful login  ELSE  Verify unsuccessful login
    Go to Publications tab
    Publicationsnavigationkeywords.Select publications from the csvfile  ${publicationfolders}
    #Get current Layout titles displayed in the page
    #Sleep  3s
    #Wait Until Element Is Enabled   ${currentlayouttitlesdisplayed_lctr}
    #@{layouttitledisplayedlist}  Get WebElements  ${currentlayouttitlesdisplayed_lctr}
    #${layouttitledisplayedcount}   Get Element Count   ${currentlayouttitlesdisplayed_lctr}
    #Log to console  ${layouttitledisplayedcount}
    #Log  ${layouttitledisplayedcount}
