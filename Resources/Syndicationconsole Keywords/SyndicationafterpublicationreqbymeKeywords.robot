
*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locatorsset2.py
Library  String
Library  ../../CustomLibs/Csv.py

*** Variables ***
${layoutmarketcountorig}  36
${layouttitlecountorig}  63
${reqmarketcountorig}  36
${reqtitlecountorig}  63
*** Keywords ***
Go to Syndication After Publication
    Wait Until Element Is Enabled   ${SyndicationAfterPublicationtab_lctr}
    Click element   ${SyndicationAfterPublicationtab_lctr}

#Req By Me initial checks
Get current Layout markets displayed in the page
    Sleep  3s
    Wait Until Element Is Enabled   ${currentlayoutmarketsdisplayed_lctr}
    @{layoutmarketdisplayedlist}  Get WebElements  ${currentlayoutmarketsdisplayed_lctr}
    ${layoutmarketdisplayedcount}   Get Element Count   ${currentlayoutmarketsdisplayed_lctr}
    Log to console  ${layoutmarketdisplayedcount}
    Log  ${layoutmarketdisplayedcount}

    FOR   ${i}    IN RANGE  0  ${${layoutmarketdisplayedcount}}
       ${LayoutmarketdisplayedText}=   get text    ${layoutmarketdisplayedlist}[${i}]
       Log to console  ${LayoutmarketdisplayedText}
       log  ${LayoutmarketdisplayedText}
    END
Get current Layout titles displayed in the page
    Sleep  3s
    Wait Until Element Is Enabled   ${currentlayouttitlesdisplayed_lctr}
    @{layouttitledisplayedlist}  Get WebElements  ${currentlayouttitlesdisplayed_lctr}
    ${layouttitledisplayedcount}   Get Element Count   ${currentlayouttitlesdisplayed_lctr}
    Log to console  ${layouttitledisplayedcount}
    Log  ${layouttitledisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${layouttitledisplayedcount}}
       ${LayouttitledisplayedText}=   get text    ${layouttitledisplayedlist}[${i}]
       Log to console  ${LayouttitledisplayedText}
       log  ${LayouttitledisplayedText}
    END

Get current reqmarkets displayed in the page
    Sleep  3s
    Wait Until Element Is Enabled   ${currentreqlayoutmarketsdisplayed_lctr}
    @{reqmarketdisplayedlist}  Get WebElements  ${currentreqlayoutmarketsdisplayed_lctr}
    ${reqmarketdisplayedcount}   Get Element Count   ${currentreqlayoutmarketsdisplayed_lctr}
    Log to console  ${reqmarketdisplayedcount}
    Log  ${reqmarketdisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${reqmarketdisplayedcount}}
       ${reqLayoutmarketdisplayedText}=   get text    ${reqmarketdisplayedlist}[${i}]
       Log to console  ${reqLayoutmarketdisplayedText}
       log  ${reqLayoutmarketdisplayedText}
    END

Get current reqtitles displayed in the page
    Sleep  3s
    Wait Until Element Is Enabled   ${currentreqlayouttitlesdisplayed_lctr}
    @{reqtitledisplayedlist}  Get WebElements  ${currentreqlayouttitlesdisplayed_lctr}
    ${reqtitledisplayedcount}   Get Element Count   ${currentreqlayouttitlesdisplayed_lctr}
    Log to console  ${reqtitledisplayedcount}
    Log  ${reqtitledisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${reqtitledisplayedcount}}
       ${reqLayouttitledisplayedText}=   get text    ${reqtitledisplayedlist}[${i}]
       Log to console  ${reqLayouttitledisplayedText}
       log  ${reqLayouttitledisplayedText}
    END

#Layoutmarketfilter
Click Layout market dropdown
    Sleep  7s
    Wait Until Element Is Enabled   ${Layoutmarketdropdownicon_lctr}
    Click element   ${Layoutmarketdropdownicon_lctr}
Get layout market list
    Sleep  3s
    Wait Until Element Is Enabled   ${Layoutmarketlist_lctr}
    @{layoutlist}  Get WebElements  ${Layoutmarketlist_lctr}
    ${layoutmarketcount}   Get Element Count   ${Layoutmarketlist_lctr}
    Log to console  ${layoutmarketcount}
    Log  ${layoutmarketcount}
    Run Keyword If  '${layoutmarketcount}' == '${layoutmarketcountorig}'  Log  Continuing execution  ELSE  FAIL
    FOR   ${i}    IN RANGE  0  ${${layoutmarketcount}}
       ${LayoutmarketText}=   get text    ${layoutlist}[${i}]
       Log to console  ${LayoutmarketText}
       log  ${LayoutmarketText}
    END
Select Layout market
    [Arguments]  ${Layoutmarketinput}
    Sleep  3s
    Wait Until Element Is Enabled   ${Layoutmarketlist_lctr}
    @{layoutlist}  Get WebElements  ${Layoutmarketlist_lctr}
    ${layoutmarketcount}   Get Element Count   ${Layoutmarketlist_lctr}
    Log to console  ${layoutmarketcount}
    Log  ${layoutmarketcount}
    FOR   ${i}    IN RANGE  0  ${${layoutmarketcount}}
       ${LayoutmarketText}=   get text    ${layoutlist}[${i}]
       Run Keyword If  '${LayoutmarketText}' == '${Layoutmarketinput}'  Click element  ${layoutlist}[${i}]  ELSE  Checking the passed market
       Exit For Loop IF    '${LayoutmarketText}' == '${Layoutmarketinput}'
       Log to console  ${LayoutmarketText}
       log  ${LayoutmarketText}
    END
Check selected Layout markets displayed in the page
    [Arguments]  ${Layoutmarketinput}
    Sleep  3s
    Page Should Contain Element  ${currentlayoutmarketsdisplayed_lctr}  Result present  Not Result present for filtered market
    Wait Until Element Is Enabled   ${currentlayoutmarketsdisplayed_lctr}
    @{layoutmarketdisplayedlist}  Get WebElements  ${currentlayoutmarketsdisplayed_lctr}
    ${layoutmarketdisplayedcount}   Get Element Count   ${currentlayoutmarketsdisplayed_lctr}
    Log to console  ${layoutmarketdisplayedcount}
    Log  ${layoutmarketdisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${layoutmarketdisplayedcount}}
       ${LayoutmarketdisplayedText}=   get text    ${layoutmarketdisplayedlist}[${i}]
       Run Keyword If  '${LayoutmarketdisplayedText}' == '${Layoutmarketinput}'  Log  Success  ELSE  Layoutmarketfilterfail
       Log to console  ${LayoutmarketdisplayedText}
       log  ${LayoutmarketdisplayedText}
    END


#Layouttitlefilter

Click Layout title dropdown
    Sleep  7s
    Wait Until Element Is Enabled   ${Layouttitledropdownicon_lctr}
    Click element   ${Layouttitledropdownicon_lctr}
Get layout title list
    Sleep  3s
    Wait Until Element Is Enabled   ${Layouttitlelist_lctr}
    @{layoutlist}  Get WebElements  ${Layouttitlelist_lctr}
    ${layouttitlecount}   Get Element Count   ${Layouttitlelist_lctr}
    Log to console  ${layouttitlecount}
    Log  ${layouttitlecount}
    Run Keyword If  '${layouttitlecount}' == '${layouttitlecountorig}'   Log  Continuing execution   ELSE  FAIL
    FOR   ${i}    IN RANGE  0  ${${layouttitlecount}}
       ${LayouttitleText}=   get text    ${layoutlist}[${i}]
       Log to console  ${LayouttitleText}
       log  ${LayouttitleText}
    END
Select Layout title
    [Arguments]  ${Layouttitleinput}
    Sleep  3s
    Wait Until Element Is Enabled   ${Layouttitlelist_lctr}
    @{layoutlist}  Get WebElements  ${Layouttitlelist_lctr}
    ${layouttitlecount}   Get Element Count   ${Layouttitlelist_lctr}
    Log to console  ${layouttitlecount}
    Log  ${layouttitlecount}
    FOR   ${i}    IN RANGE  0  ${${layouttitlecount}}
       ${LayouttitleText}=   get text    ${layoutlist}[${i}]
       Convert to String  ${LayouttitleText}
       ${LayouttitleTextmodified}  replacespacestitle  ${LayouttitleText}
       Run Keyword If  '${LayouttitleTextmodified}' == '${Layouttitleinput}'  Click element  ${layoutlist}[${i}]  ELSE  Checking the passed title
       Exit For Loop IF    '${LayouttitleTextmodified}' == '${Layouttitleinput}'
       Log to console  ${LayouttitleText}
       log  ${LayouttitleText}
    END
Check selected Layout titles displayed in the page
    [Arguments]  ${Layouttitleinput}
    Sleep  3s
    Page Should Contain Element  ${currentlayouttitlesdisplayed_lctr}  Result present  Not Result present for filtered title
    Wait Until Element Is Enabled   ${currentlayouttitlesdisplayed_lctr}
    @{layouttitledisplayedlist}  Get WebElements  ${currentlayouttitlesdisplayed_lctr}
    ${layouttitledisplayedcount}   Get Element Count   ${currentlayouttitlesdisplayed_lctr}
    Log to console  ${layouttitledisplayedcount}
    Log  ${layouttitledisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${layouttitledisplayedcount}}
       ${LayouttitledisplayedText}=   get text    ${layouttitledisplayedlist}[${i}]
       Run Keyword If  '${LayouttitledisplayedText}' == '${Layouttitleinput}'  Log  Success  ELSE  Log  Layoutmarketfilterfail
       Log to console  ${LayouttitledisplayedText}
       log  ${LayouttitledisplayedText}
    END

#Requestingmarketdropdown

Click Requesting market dropdown
    Sleep  7s
    Wait Until Element Is Enabled   ${Requestingmarketdropdownicon_lctr}
    Click element   ${Requestingmarketdropdownicon_lctr}
Get Requesting market list
    Sleep  3s
    Wait Until Element Is Enabled   ${Requestingmarketlist_lctr}
    @{layoutlist}  Get WebElements  ${Requestingmarketlist_lctr}
    ${Requestingmarketcount}   Get Element Count   ${Requestingmarketlist_lctr}
    Log to console  ${Requestingmarketcount}
    Log  ${Requestingmarketcount}
    Run Keyword If  '${Requestingmarketcount}' == '${reqmarketcountorig}'  Log  Continuing execution  ELSE  FAIL
    FOR   ${i}    IN RANGE  0  ${${Requestingmarketcount}}
       ${RequestingmarketText}=   get text    ${layoutlist}[${i}]
       Log to console  ${RequestingmarketText}
       log  ${RequestingmarketText}
    END

Select Requesting market
    [Arguments]  ${requestingmarketinput}
    Sleep  3s
    Wait Until Element Is Enabled   ${Requestingmarketlist_lctr}
    @{reqmarketlist}  Get WebElements  ${Requestingmarketlist_lctr}
    ${reqmarketcount}   Get Element Count   ${Requestingmarketlist_lctr}
    Log to console  ${reqmarketcount}
    Log  ${reqmarketcount}
    FOR   ${i}    IN RANGE  0  ${${reqmarketcount}}
       ${ReqmarketText}=   get text    ${reqmarketlist}[${i}]
       Run Keyword If  '${ReqmarketText}' == '${requestingmarketinput}'  Click element  ${reqmarketlist}[${i}]  ELSE  Checking the passed title
       Exit For Loop IF    '${ReqmarketText}' == '${requestingmarketinput}'
       Log to console  ${ReqmarketText}
       log  ${ReqmarketText}
    Sleep  2s
    END

Check selected Requesting markets displayed in the page
    [Arguments]  ${requestingmarketinput}
    Sleep  3s
    Page Should Contain Element  ${currentreqlayoutmarketsdisplayed_lctr}  Not Result present for filtered market
    Wait Until Element Is Enabled   ${currentreqlayoutmarketsdisplayed_lctr}
    @{reqmarketdisplayedlist}  Get WebElements  ${currentreqlayoutmarketsdisplayed_lctr}
    ${reqmarketdisplayedcount}   Get Element Count   ${currentreqlayoutmarketsdisplayed_lctr}
    Log to console  ${reqmarketdisplayedcount}
    Log  ${reqmarketdisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${reqmarketdisplayedcount}}
       ${reqmarketdisplayedText}=   get text    ${reqmarketdisplayedlist}[${i}]
       Run Keyword If  '${reqmarketdisplayedText}' == '${requestingmarketinput}'  Log  Success  ELSE  Log  Layoutmarketfilterfail
       Log to console  ${reqmarketdisplayedText}
       log  ${reqmarketdisplayedText}
    END

#Requestingtitledropdown

Click Requesting title dropdown
    Sleep  7s
    Wait Until Element Is Enabled   ${Requestingtitledropdownicon_lctr}
    Click element   ${Requestingtitledropdownicon_lctr}
Get Requesting title list
    Sleep  3s
    Wait Until Element Is Enabled   ${Requestingtitlelist_lctr}
    @{layoutlist}   Get WebElements  ${Requestingtitlelist_lctr}
    ${Requestingtitlecount}   Get Element Count   ${Requestingtitlelist_lctr}
    Log to console  ${Requestingtitlecount}
    Log  ${Requestingtitlecount}
    Run Keyword If  '${Requestingtitlecount}' == '${reqtitlecountorig}'  Log  Continuing execution   ELSE  FAIL
    FOR   ${i}    IN RANGE  0  ${${Requestingtitlecount}}
       ${RequestingtitleText}=   get text    ${layoutlist}[${i}]
       Log to console  ${RequestingtitleText}
       log  ${RequestingtitleText}
    END

Select Requesting title
    [Arguments]  ${requestingtitleinput}
    Sleep  3s
    Wait Until Element Is Enabled   ${Requestingtitlelist_lctr}
    @{reqtitlelist}  Get WebElements  ${Requestingtitlelist_lctr}
    ${reqtitlecount}   Get Element Count   ${Requestingtitlelist_lctr}
    Log to console  ${reqtitlecount}
    Log  ${reqtitlecount}
    FOR   ${i}    IN RANGE  0  ${${reqtitlecount}}
       ${ReqtitleText}=   get text    ${reqtitlelist}[${i}]
       Convert to String  ${ReqtitleText}
       ${ReqtitleTextmodified}  replacespacestitle  ${ReqtitleText}
       Run Keyword If  '${ReqtitleTextmodified}' == '${requestingtitleinput}'  Click element  ${reqtitlelist}[${i}]  ELSE  Checking the passed title
       Exit For Loop IF    '${ReqtitleTextmodified}' == '${requestingtitleinput}'
       Log to console  ${ReqtitleText}
       log  ${ReqtitleText}
    Sleep  2s
    END
Check selected Requesting titles displayed in the page
    [Arguments]  ${requestingtitleinput}
    Sleep  3s
    Page Should Contain Element  ${currentreqlayouttitlesdisplayed_lctr}  Not Result present for filtered market
    Wait Until Element Is Enabled   ${currentreqlayouttitlesdisplayed_lctr}
    @{reqtitledisplayedlist}  Get WebElements  ${currentreqlayouttitlesdisplayed_lctr}
    ${reqtitledisplayedcount}   Get Element Count   ${currentreqlayouttitlesdisplayed_lctr}
    Log to console  ${reqtitledisplayedcount}
    Log  ${reqtitledisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${reqtitledisplayedcount}}
       ${reqtitledisplayedText}=   get text    ${reqtitledisplayedlist}[${i}]
       Run Keyword If  '${reqtitledisplayedText}' == '${requestingtitleinput}'  Log  Success  ELSE  Layoutmarketfilterfail
       Log to console  ${reqtitledisplayedText}
       log  ${reqtitledisplayedText}
    END


Checking the passed market
    Log  Checking other markets
Checking the passed title
    Log  Checking other titles
Layoutmarketfilterfail
    Fail  Market not displayed according to filter



