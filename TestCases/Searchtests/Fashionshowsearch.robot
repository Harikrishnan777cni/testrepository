*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/Search Keywords/BasicsearchKeywords.robot
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Search Keywords/FashionshowKeywords.robot
Variables  ../../PageObjects/Locators.py
Variables  ../../PageObjects/Variables.py
Library  DataDriver  ../../TestData/FashionshowSearchData.csv
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase
Test Template  Fashionshowsearchtest



*** Test Cases ***
Fashionshowsearchwithcsv using ${username} and ${password}

*** Keywords ***

Fashionshowsearchtest
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
    Click search text field
    Go to fashion search tab
    Enter fashionshow search text   ${searchinput1}
    Select Search button
    Click pleaseaddfilterokbutton and retry search
    Page Should Not Contain Element  ${Publications_noresult_lctr}  message=no results found.please try again
    #Check fashionshow search result  ${searchinput1}
    ${verificationstatus}  Run Keyword And Return Status  Check fashionshow search result  ${searchinput1}
    Run Keyword If  '${verificationstatus}' == 'False'  DoubleclickandcheckkeywordinfashionADP  ${searchinput1}   ELSE  Log  Exactmatchfound
