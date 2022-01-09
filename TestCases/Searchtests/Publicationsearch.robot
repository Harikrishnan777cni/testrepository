*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/Search Keywords/BasicsearchKeywords.robot
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Search Keywords/PublicationsearchKeywords.robot
Variables  ../../PageObjects/Variables.py
Library  DataDriver  ../../TestData/PublicationSearchData.csv
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase
Test Template  Publicationsearchtest


*** Test Cases ***
Publicationsearchwithcsv using ${username} and ${password}

*** Keywords ***

Publicationsearchtest
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
    Go to Publications tab
    Go to Publications search tab
    Enter Publications search text  ${searchinput1}
    Enter Publications search button
    Click pleaseaddfilterokbutton and retry search for publication search
    Capture Page Screenshot
    Page Should Not Contain Element  ${Publications_noresult_lctr}  message=no results found.please try again
    ${verificationstatus}  Run Keyword And Return Status  Verify successful publication search  ${searchinput1}
    Run Keyword If  '${verificationstatus}' == 'False'  DoubleclickandcheckkeywordinPDP  ${searchinput1}   ELSE  Log  Exactmatchfound
    Log  ${verificationstatus}

    #Page Should Contain  ${Searchresultmarketname}
    #Page Should Contain  ${Searchresultissuename}

