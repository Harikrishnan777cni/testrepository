*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/CommonFunctionality.robot
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase

*** Variables ***
${Browser}  chrome
${SiteUrl}  https://emea-staging.cnidam.com
${user}  uk-wired-piced@condenast.com
${pwd}  Tuesday2020!*

*** Test Cases ***

LoginTest
    [Tags]  Smoke
    Open my url  ${SiteUrl}
    Enter UserName  ${user}
    Enter Password  ${pwd}
    Click Verify
    Check welcomemessage  ${user}
    ${act_title}  Get Title
    Run Keyword If  '${act_title}' == 'Staging EMEA | Welcome to AEM'  Verify successful login  ELSE  Verify unsuccessful login
    #Linkslogging
    ${AllLinksCount}   Get Element Count  xpath://a
    log to console  ${AllLinksCount}
    log  ${AllLinksCount}

    @{LinkItems}  create list

    FOR   ${i}    IN RANGE  1  ${AllLinksCount+1}
       ${linkText}=   get text    xpath:(//a)[${i}]
       Log to console  ${linkText}
    END
    #Welcomemessagechecking
    Check welcomemessage  ${user}