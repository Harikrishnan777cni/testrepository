*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/Search Keywords/BasicsearchKeywords.robot
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Search Keywords/BasicsearchKeywords.robot
Resource  ../../Resources/Search Keywords/AdvancedsearchKeywords.robot
Variables  ../../PageObjects/Variables.py
Library  DataDriver  ../../TestData/AdvancedSearchData.csv
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase
Test Template  Advancedsearchtest



*** Test Cases ***
Advancedsearchwithcsv using ${username} and ${password}

*** Keywords ***

Advancedsearchtest
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
    Go to images page
    Go to search tab
    Go to advanced search tab
    Enter advanced search text  ${searchinput1}
    Select folder type checkbox
    Select ragstatuscheckbox
    Select Search button
    ${count}  Check if any result is getting fetched
    ${verificationstatus}  Run Keyword If   ${count} > 0   Run Keyword And Return Status  Check search result  ${searchinput1}  ELSE  FAIL  No search results.Please try again
    Run Keyword If  '${verificationstatus}' == 'False'  DoubleclickandcheckkeywordandraginADP  ${searchinput1}   ELSE  Log  Exactmatchfound
    Log  ${verificationstatus}

