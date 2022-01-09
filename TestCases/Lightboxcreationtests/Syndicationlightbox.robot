*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Lightbox creation Keywords/SyndicationLightboxKeywords.robot
Variables  ../../PageObjects/Variables.py
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase
Library  DataDriver  ../../TestData/LightboxLoginData.csv
Test Template  Lightboxcreationtest


*** Test Cases ***
Lightboxcreationtestwithcsv using ${username} and ${password}

*** Keywords ***
Lightboxcreationtest
    [Tags]  Smoke
    [Arguments]  ${SiteUrl}  ${username}  ${password}  ${userrole}  ${market}  ${title}
    Open my url   ${SiteUrl}
    Enter UserName  ${username}
    Enter Password  ${password}
    Click Verify
    Check welcomemessage  ${username}
    ${act_title}  Get Title
    Run Keyword If  '${act_title}' == '${expectedpagetitle_emea}' and '${SiteUrl}' == '${expectedsiteurl_emea}' or '${act_title}' == '${expectedpagetitle_apac}' and '${SiteUrl}' == '${expectedsiteurl_apac}'   Verify successful login  ELSE  Verify unsuccessful login
    Run Keyword If  '${userrole}' == 'piced' or '${userrole}' == 'ebt'  Welcomepagetabscheck_ebtorpiced  ELSE    Welcomepagetabscheck_globaladmin
    Go to images page
    #Reload page
    clickltboxexpandarrow
    clickltboxsearchtool
    createnewltboxoption
    ${lightbox_nameinput}  enterltboxname
    selctltboxlocation
    selctmarketfolder  ${market}
    selecttitlefolder  ${title}
    selectwipfolder
    selectokbutton
    clickcreatebutton
    selectswitchlt
    selctltboxlocator
    selctmarketfolder  ${market}
    selecttitlefolder  ${title}
    selectwipfolder
    Lightboxverify  ${lightbox_nameinput}