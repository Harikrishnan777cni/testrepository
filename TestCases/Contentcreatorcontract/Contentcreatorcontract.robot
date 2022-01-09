*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/Contentcreator Keywords/ContentcreatorKeywords.robot
Variables  ../../PageObjects/Locators.py
Variables  ../../PageObjects/Variables.py
Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase
Library  DataDriver  ../../TestData/ContentcreatorcontractLoginData.csv
Test Template  Contentcreatorcontracttest

*** Variables ***
${firstname_input}  testcontract887
${lastname_input}   contract887
${contractdescriptioninput}  TestDescription

*** Test Cases ***
Contentcreatorcontracttest using  ${username} and ${password}

*** Keywords ***
Contentcreatorcontracttest
    [Tags]  Smoke
    [Arguments]  ${SiteUrl}  ${username}  ${password}  ${userrole}  ${creatortype}  ${markettextfield}
    Open my url   ${SiteUrl}
    Enter UserName  ${username}
    Enter Password  ${password}
    Click Verify
    Check welcomemessage  ${username}
    ${act_title}  Get Title
    Run Keyword If  '${act_title}' == '${expectedpagetitle_emea}' and '${SiteUrl}' == '${expectedsiteurl_emea}' or '${act_title}' == '${expectedpagetitle_apac}' and '${SiteUrl}' == '${expectedsiteurl_apac}'   Verify successful login  ELSE  Verify unsuccessful login
    Run Keyword If  '${userrole}' == 'piced' or '${userrole}' == 'ebt'  Welcomepagetabscheck_ebtorpiced  ELSE    Welcomepagetabscheck_globaladmin
    Go to contract creator option
    Select action drop down option
    Select create option
    ${firstnamevalue}  Enter first name
    Log  ${firstnamevalue}
    ${lastnamevalue}  Enter last name
    Log  ${lastnamevalue}
    Enter creatortype field  ${creatortype}
    Select creator type  ${creatortype}
    Mark isactivecheckbox
    Click save
    ${str1}  Convert To Upper Case   ${lastnamevalue}
    log  ${str1}
    ${str2}  Catenate  ${str1}, ${firstnamevalue}
    Element Text Should Be  ${contentcreator_contractnameaftercreated_lctr}  ${str2}
    Select add contract button
    Input contract description  ${contractdescriptioninput}
    Input market textfield  ${markettextfield}
    Select market suggestion  ${markettextfield}
    Open calender
    Select date
    Select commissionedradiobutton
    Click save button
    Go back to details tab
    Check contract space   ${contractdescriptioninput}
