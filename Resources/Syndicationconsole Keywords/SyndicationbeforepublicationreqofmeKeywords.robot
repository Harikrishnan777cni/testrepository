*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locatorsset2.py

*** Variables ***
${layoutmarketcountorig}  36
${layouttitlecountorig}  63
${reqmarketcountorig}  36
${reqtitlecountorig}  63


*** Keywords ***
Go to Syndication Before Publication
    Wait Until Element Is Enabled   ${SyndicationBeforePublicationtabicon_lctr}
    Click element   ${SyndicationBeforePublicationtabicon_lctr}
Go to Requested Of Me tab
    Wait Until Element Is Enabled   ${wipRequestedOfMetab_lctr}
    Click element   ${wipRequestedOfMetab_lctr}

#Req By Me initial checks
Get current Layout markets displayed in the page
    Sleep  20s
    Wait Until Element Is Enabled   ${reqofme_wip_currentlayoutmarketsdisplayed}
    @{layoutmarketdisplayedlist}  Get WebElements  ${reqofme_wip_currentlayoutmarketsdisplayed}
    ${layoutmarketdisplayedcount}   Get Element Count   ${reqofme_wip_currentlayoutmarketsdisplayed}
    Log to console  ${layoutmarketdisplayedcount}
    Log  ${layoutmarketdisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${layoutmarketdisplayedcount}}
       ${LayoutmarketdisplayedText}=   get text    ${layoutmarketdisplayedlist}[${i}]
       Log to console  ${LayoutmarketdisplayedText}
       log  ${LayoutmarketdisplayedText}
    END
Get current Layout titles displayed in the page
    Sleep  3s
    Wait Until Element Is Enabled   ${reqofme_wip_currentlayouttitlesdisplayed}
    @{layouttitledisplayedlist}  Get WebElements  ${reqofme_wip_currentlayouttitlesdisplayed}
    ${layouttitledisplayedcount}   Get Element Count   ${reqofme_wip_currentlayouttitlesdisplayed}
    Log to console  ${layouttitledisplayedcount}
    Log  ${layouttitledisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${layouttitledisplayedcount}}
       ${LayouttitledisplayedText}=   get text    ${layouttitledisplayedlist}[${i}]
       Log to console  ${LayouttitledisplayedText}
       log  ${LayouttitledisplayedText}
    END

Get current reqmarkets displayed in the page
    Sleep  3s
    Wait Until Element Is Enabled   ${reqofme_wip_currentreqmarketsdisplayed}
    @{reqmarketdisplayedlist}  Get WebElements  ${reqofme_wip_currentreqmarketsdisplayed}
    ${reqmarketdisplayedcount}   Get Element Count   ${reqofme_wip_currentreqmarketsdisplayed}
    Log to console  ${reqmarketdisplayedcount}
    Log  ${reqmarketdisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${reqmarketdisplayedcount}}
       ${reqLayoutmarketdisplayedText}=   get text    ${reqmarketdisplayedlist}[${i}]
       Log to console  ${reqLayoutmarketdisplayedText}
       log  ${reqLayoutmarketdisplayedText}
    END

Get current reqtitles displayed in the page
    Sleep  3s
    Wait Until Element Is Enabled   ${reqofme_wip_currentreqtitlesdisplayed}
    @{reqtitledisplayedlist}  Get WebElements  ${reqofme_wip_currentreqtitlesdisplayed}
    ${reqtitledisplayedcount}   Get Element Count   ${reqofme_wip_currentreqtitlesdisplayed}
    Log to console  ${reqtitledisplayedcount}
    Log  ${reqtitledisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${reqtitledisplayedcount}}
       ${reqLayouttitledisplayedText}=   get text    ${reqtitledisplayedlist}[${i}]
       Log to console  ${reqLayouttitledisplayedText}
       log  ${reqLayouttitledisplayedText}
    END

#Layout market filter
Click Layout market dropdown
    Sleep  7s
    Wait Until Element Is Enabled   ${reqofme_wipLayoutmarketdropdownicon}
    Mouse down  ${reqofme_wipLayoutmarketdropdownicon}
    Click element   ${reqofme_wipLayoutmarketdropdownicon}
Get layout market list
    Sleep  3s
    Wait Until Element Is Enabled   ${reqofme_wipLayoutmarketlist}
    @{layoutlist}  Get WebElements  ${reqofme_wipLayoutmarketlist}
    ${layoutmarketcount}   Get Element Count   ${reqofme_wipLayoutmarketlist}
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
    Wait Until Element Is Enabled   ${reqofme_wipLayoutmarketlist}
    @{layoutlist}  Get WebElements  ${reqofme_wipLayoutmarketlist}
    ${layoutmarketcount}   Get Element Count   ${reqofme_wipLayoutmarketlist}
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
    Page Should Contain Element  ${reqofme_wip_currentlayoutmarketsdisplayed}  Result present  Not Result present for filtered market
    Wait Until Element Is Enabled   ${reqofme_wip_currentlayoutmarketsdisplayed}
    @{layoutmarketdisplayedlist}  Get WebElements  ${reqofme_wip_currentlayoutmarketsdisplayed}
    ${layoutmarketdisplayedcount}   Get Element Count   ${reqofme_wip_currentlayoutmarketsdisplayed}
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
    Wait Until Element Is Enabled   ${reqofme_wipLayouttitledropdownicon}
    Click element   ${reqofme_wipLayouttitledropdownicon}
Get layout title list
    Sleep  3s
    Wait Until Element Is Enabled   ${reqofme_wipLayouttitlelist}
    @{layoutlist}  Get WebElements  ${reqofme_wipLayouttitlelist}
    ${layouttitlecount}   Get Element Count   ${reqofme_wipLayouttitlelist}
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
    Wait Until Element Is Enabled   ${reqofme_wipLayouttitlelist}
    @{layoutlist}  Get WebElements  ${reqofme_wipLayouttitlelist}
    ${layouttitlecount}   Get Element Count   ${reqofme_wipLayouttitlelist}
    Log to console  ${layouttitlecount}
    Log  ${layouttitlecount}
    FOR   ${i}    IN RANGE  0  ${${layouttitlecount}}
       ${LayouttitleText}=   get text    ${layoutlist}[${i}]
       Run Keyword If  "${LayouttitleText}" == "${Layouttitleinput}"  Click element  ${layoutlist}[${i}]  ELSE  Checking the passed title
       Exit For Loop IF    "${LayouttitleText}" == "${Layouttitleinput}"
       Log to console  ${LayouttitleText}
       log  ${LayouttitleText}
    END

Check selected Layout titles displayed in the page
    [Arguments]  ${Layouttitleinput}
    Sleep  3s
    Page Should Contain Element  ${reqofme_wip_currentlayouttitlesdisplayed}  Result present  Not Result present for filtered title
    Wait Until Element Is Enabled   ${reqofme_wip_currentlayouttitlesdisplayed}
    @{layouttitledisplayedlist}  Get WebElements  ${reqofme_wip_currentlayouttitlesdisplayed}
    ${layouttitledisplayedcount}   Get Element Count   ${reqofme_wip_currentlayouttitlesdisplayed}
    Log to console  ${layouttitledisplayedcount}
    Log  ${layouttitledisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${layouttitledisplayedcount}}
       ${LayouttitledisplayedText}=   get text    ${layouttitledisplayedlist}[${i}]
       Run Keyword If  "${LayouttitledisplayedText}" == "${Layouttitleinput}"  Log  Success  ELSE  Log  Layoutmarketfilterfail
       Log to console  ${LayouttitledisplayedText}
       log  ${LayouttitledisplayedText}
    END

#Requesting market drop down

Click Requesting market dropdown
    Sleep  7s
    Wait Until Element Is Enabled   ${reqofme_wipRequestingmarketdropdownicon}
    Click element   ${reqofme_wipRequestingmarketdropdownicon}
Get Requesting market list
    Sleep  3s
    Wait Until Element Is Enabled   ${reqofme_wipRequestingmarketlist}
    @{layoutlist}  Get WebElements  ${reqofme_wipRequestingmarketlist}
    ${Requestingmarketcount}   Get Element Count   ${reqofme_wipRequestingmarketlist}
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
    Wait Until Element Is Enabled   ${reqofme_wipRequestingmarketlist}
    @{reqmarketlist}  Get WebElements  ${reqofme_wipRequestingmarketlist}
    ${reqmarketcount}   Get Element Count   ${reqofme_wipRequestingmarketlist}
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
    Page Should Contain Element  ${reqofme_wip_currentreqmarketsdisplayed}  Result present  Not Result present for filtered market
    Wait Until Element Is Enabled   ${reqofme_wip_currentreqmarketsdisplayed}
    @{reqmarketdisplayedlist}  Get WebElements  ${reqofme_wip_currentreqmarketsdisplayed}
    ${reqmarketdisplayedcount}   Get Element Count   ${reqofme_wip_currentreqmarketsdisplayed}
    Log to console  ${reqmarketdisplayedcount}
    Log  ${reqmarketdisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${reqmarketdisplayedcount}}
       ${reqmarketdisplayedText}=   get text    ${reqmarketdisplayedlist}[${i}]
       Run Keyword If  '${reqmarketdisplayedText}' == '${requestingmarketinput}'  Log  Success  ELSE  Layoutmarketfilterfail
       Log to console  ${reqmarketdisplayedText}
       log  ${reqmarketdisplayedText}
    END
#Requestingtitledropdown

Click Requesting title dropdown
    Sleep  7s
    Wait Until Element Is Enabled   ${reqofme_wipRequestingtitledropdownicon}
    Click element   ${reqofme_wipRequestingtitledropdownicon}
Get Requesting title list
    Sleep  3s
    Wait Until Element Is Enabled   ${reqofme_wipRequestingtitlelist}
    @{layoutlist}   Get WebElements  ${reqofme_wipRequestingtitlelist}
    ${Requestingtitlecount}   Get Element Count   ${reqofme_wipRequestingtitlelist}
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
    Wait Until Element Is Enabled   ${reqofme_wipRequestingtitlelist}
    @{reqtitlelist}  Get WebElements  ${reqofme_wipRequestingtitlelist}
    ${reqtitlecount}   Get Element Count   ${reqofme_wipRequestingtitlelist}
    Log to console  ${reqtitlecount}
    Log  ${reqtitlecount}
    FOR   ${i}    IN RANGE  0  ${${reqtitlecount}}
       ${ReqtitleText}=   get text    ${reqtitlelist}[${i}]
       Run Keyword If  "${ReqtitleText}" == "${requestingtitleinput}"  Click element  ${reqtitlelist}[${i}]  ELSE  Checking the passed title
       Exit For Loop IF    "${ReqtitleText}" == "${requestingtitleinput}"
       Log to console  ${ReqtitleText}
       log  ${ReqtitleText}
    Sleep  2s
    END

Check selected Requesting titles displayed in the page
    [Arguments]  ${requestingtitleinput}
    Sleep  3s
    Page Should Contain Element  ${reqofme_wip_currentreqtitlesdisplayed}  Result present  Not Result present for filtered market
    Wait Until Element Is Enabled   ${reqofme_wip_currentreqtitlesdisplayed}
    @{reqtitledisplayedlist}  Get WebElements  ${reqofme_wip_currentreqtitlesdisplayed}
    ${reqtitledisplayedcount}   Get Element Count   ${reqofme_wip_currentreqtitlesdisplayed}
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


