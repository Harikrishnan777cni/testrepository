*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/Search Keywords/BasicsearchKeywords.robot
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Search Keywords/TouchuisearchKeywords.robot
Variables  ../../PageObjects/Variables.py
Library  DataDriver  ../../TestData/SearchData.csv
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase
Test Template  TouchUIsearchtest

*** Variables ***
${Browser}  chrome
${SiteUrl}  https://emea-staging.cnidam.com
${user}  uk-wired-piced@condenast.com
${pwd}  Tuesday2020!*
${Touchuissearch_input}  elegantnature
${Touchui_result}  elegantnature
${filter_result1}  Req. approval
${filter_result2}  Restricted
${filter_result3}  Free

*** Test Cases ***
TouchUIsearchtest using ${username} and ${password}

*** Keywords ***

TouchUIsearchtest
    [Tags]  Smoke
    [Arguments]  ${SiteUrl}  ${username}  ${password}  ${userrole}  ${searchinput1}
    Open my url   ${SiteUrl}
    Enter UserName  ${username}
    Enter Password  ${password}
    Click Verify
    Check welcomemessage  ${username}
    ${act_title}  Get Title
    Run Keyword If  '${act_title}' == '${expectedpagetitle_emea}' and '${SiteUrl}' == '${expectedsiteurl_emea}' or '${act_title}' == '${expectedpagetitle_apac}' and '${SiteUrl}' == '${expectedsiteurl_apac}'   Verify successful login  ELSE  Verify unsuccessful login
    Run Keyword If  '${userrole}' == 'piced' or '${userrole}' == 'ebt'  Welcomepagetabscheck_ebtorpiced  ELSE    Welcomepagetabscheck_globaladmin
    Go to Touchui tab
    Close Productnavigation
    Click Touchui search icon
    Input search text in Touch UI  ${searchinput1}
    Run Keyword And Ignore Error  Check omnisearchsuggestions  ${searchinput1}
    Press Keys  ${Touchuisearchtextfield_lctr}   ENTER
    Click blank space
    Page Should Not Contain Element  ${touchuinoresultsfound_lctr}  message=no results found.please try again
    ${verificationstatus}  Run Keyword And Return Status  Check results  ${searchinput1}
    ${status}  Run Keyword If  '${verificationstatus}' == 'False'  ClickinfoandcheckkeywordinADP  ${searchinput1}   ELSE  Log  Exact match found
    Click leftbar
    Select Filters
    Select File Type
    Select Images checkbox
    Select Reqapprovalcheckbox
    Page Should Not Contain Element  ${touchuinoresultsfound_lctr}  message=no results found.please try again
    Check filtered results  ${filter_result1}  ${filter_result2}  ${filter_result3}