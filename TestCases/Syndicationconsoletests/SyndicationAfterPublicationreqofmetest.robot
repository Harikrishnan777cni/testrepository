*** Settings ***
Library  SeleniumLibrary
Library  String
Library  ../../CustomLibs/Csv.py
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Syndicationconsole Keywords/SyndicationafterpublicationreqofmeKeywords.robot
Test Setup  CommonFunctionality.Start TestCase
#Test Teardown  CommonFunctionality.Finish TestCase

*** Variables ***
${Browser}  chrome
${SiteUrl}  https://emea-staging.cnidam.com
${user}  harikrishnan.sreekumaran@condenast.com
${pwd}   Mondaytuesday2021!
${layoutmarketinput}  United Kingdom
${layouttileinput}  Vogue
${requestingmarketinput}  Africa
${requestingtitleinput}  Vogue

*** Test Cases ***
SyndicationAfterpublication
    [Tags]  Smoke
    Open my url   ${SiteUrl}
    Enter UserName  ${user}
    Enter Password  ${pwd}
    Click Verify
    Sleep  7s
    ${act_title}  Get Title
    Run Keyword If  '${act_title}' == 'Staging EMEA | Welcome to AEM'  Verify successful login  ELSE  Verify unsuccessful login
    Go to Syndication After Publication
    Sleep  5s
    Select Reqofmetab
    Sleep  5s
    #Req Of Me initial checks
    Get current Layout markets displayed in the page
    Get current Layout titles displayed in the page
    Get current reqmarkets displayed in the page
    Get current reqtitles displayed in the page
    #Layoutmarketfilter
    Click Layout market dropdown
    Get layout market list
    Select Layout market  ${layoutmarketinput}
    Check selected Layout markets displayed in the page  ${layoutmarketinput}
    #Layouttitlefilter
    Click Layout title dropdown
    Get layout title list
    Select Layout title  ${layouttileinput}
    Check selected Layout titles displayed in the page  ${layouttileinput}
    #Requestingmarketdropdown
    Click Requesting market dropdown
    Get Requesting market list
    Select Requesting market  ${requestingmarketinput}
    Check selected Requesting markets displayed in the page  ${requestingmarketinput}
    #Requestingtitledropdown
    Click Requesting title dropdown
    Get Requesting title list
    Select Requesting title  ${requestingtitleinput}
    Check selected Requesting titles displayed in the page  ${requestingtitleinput}