*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/Search Keywords/BasicsearchKeywords.robot
Variables  ../../PageObjects/Variables.py
Library  DataDriver  ../../TestData/SearchData.csv
Test Template  Basicsearchtest
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase




*** Test Cases ***
Basicsearchtest using ${username} and ${password}


*** Keywords ***
Basicsearchtest
    [Tags]  Smoke
    [Arguments]  ${SiteUrl}  ${username}  ${password}  ${userrole}  ${searchinput1}  ${searchinput2}
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
    Enter search text   ${searchinput1}
    Click search button
    Click pleaseaddfilterokbutton and retry search
    ${count}  Check if any result is getting fetched
    ${verificationstatus}  Run Keyword If   ${count} > 0   Run Keyword And Return Status  Verify successful search  ${searchinput1}  ELSE  FAIL  No search results.Please try again
    Run Keyword If  '${verificationstatus}' == 'False'  DoubleclickandcheckkeywordinADP  ${searchinput1}   ELSE  Log  Exactmatchfound
    #Verify successful search  ${searchinput1}
    Log  ${verificationstatus}
    Click clear button
    Enter search text   ${searchinput2}
    Check autosuggestion  ${searchinput2}

