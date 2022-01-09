*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locators.py

*** Variables ***
${Browser}  chrome
${text}  Images
@{welcomepagetabs}  Images  Images - Touch UI  Publications  Content creators contracts  Videos  Syndication after publication  Syndication before publication  Inbox
@{welcomepagetabs_globaladmin}  Images  Images - Touch UI  Publications  Content creators contracts  Videos  Syndication after publication  Syndication before publication  Fashion Shows  Fashion Shows - Touch UI  Inbox  Users  Tools  Tagging

*** Keywords ***
Open my url
    [Arguments]  ${SiteUrl}
    go to  ${SiteUrl}
    maximize browser window

Enter UserName
    [Arguments]  ${username}
    Wait Until Page Contains Element  ${txt_loginUserName_lctr}  timeout=30s
    Input Text  ${txt_loginUserName_lctr}  ${username}
    click button  ${submitbutton_lctr}

Enter Password

    Wait Until Page Contains Element  ${txt_loginps_lctr}  timeout=30s
    [Arguments]  ${password}
    Input Text  ${txt_loginps_lctr}  ${password}

Click Verify
    Wait Until Page Contains Element  ${txt_verify_lctr}  timeout=30s
    click button   ${txt_verify_lctr}

Verify successful login
    Log  **********Login test is passed**********
    Log Title


Verify unsuccessful login
    capture page screenshot  /Users/hsreekum/PycharmProjects/RobotFWTutorial/Screenshots/ll.png
    Fail  **********Login test is failed**********

Check welcomemessage
    [Arguments]  ${usernameinput}
    Wait Until Page Contains Element  ${welcomemessage_lctr}  timeout=30s
    Element should contain  ${welcomemessage_lctr}  ${usernameinput}

Welcomepagetabscheck_ebtorpiced
    Wait Until Page Contains Element  ${tabcontent_lctr}  timeout=30s
    ${AllTabsCount}   Get Element Count  ${tabcontent_lctr}
    @{TabItems}  Get WebElements  ${tabcontent_lctr}
    log  ${AllTabsCount}
    FOR   ${i}    IN RANGE  0  ${${AllTabsCount}}
       ${TabText}=   get text    ${TabItems}[${i}]
        log  ${TabText}
       Log   ${welcomepagetabs}[${i}]
       Run Keyword If  '${welcomepagetabs}[${i}]' == '${TabText}'  Log  pass  ELSE  FAIL  ***Title mismatch***

    END

Welcomepagetabscheck_globaladmin
    Wait Until Page Contains Element  ${tabcontent_lctr}  timeout=30s
    ${AllTabsCount}   Get Element Count  ${tabcontent_lctr}
    @{TabItems}  Get WebElements  ${tabcontent_lctr}
    log  ${AllTabsCount}
    FOR   ${i}    IN RANGE  0  ${${AllTabsCount}}
       ${TabText}=   get text    ${TabItems}[${i}]

       log  ${TabText}
       Log   ${welcomepagetabs_globaladmin}[${i}]
       Run Keyword If  '${welcomepagetabs_globaladmin}[${i}]' == '${TabText}'  Log  pass  ELSE  FAIL  ***Title mismatch***

    END


