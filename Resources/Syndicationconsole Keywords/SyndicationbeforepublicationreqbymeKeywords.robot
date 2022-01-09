
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
    Wait Until Element Is Enabled   ${Syndicationbeforepublicationtabicon_lctr}
    Click element   ${Syndicationbeforepublicationtabicon_lctr}
Go to Requested By Me tab
    Wait Until Element Is Enabled   ${wipRequestedByMetab_lctr}
    Click element   ${wipRequestedByMetab_lctr}

#Req By Me initial checks
Get current Layout markets displayed in the page
    Sleep  3s
    Wait Until Element Is Enabled   ${wip_currentlayoutmarketsdisplayed_lctr}
    @{layoutmarketdisplayedlist}  Get WebElements  ${wip_currentlayoutmarketsdisplayed_lctr}
    ${layoutmarketdisplayedcount}   Get Element Count   ${wip_currentlayoutmarketsdisplayed_lctr}
    Log to console  ${layoutmarketdisplayedcount}
    Log  ${layoutmarketdisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${layoutmarketdisplayedcount}}
       ${LayoutmarketdisplayedText}=   get text    ${layoutmarketdisplayedlist}[${i}]
       Log to console  ${LayoutmarketdisplayedText}
       log  ${LayoutmarketdisplayedText}
    END
Get current Layout titles displayed in the page
    Sleep  3s
    Wait Until Element Is Enabled   ${wip_currentlayouttitlesdisplayed_lctr}
    @{layouttitledisplayedlist}  Get WebElements  ${wip_currentlayouttitlesdisplayed_lctr}
    ${layouttitledisplayedcount}   Get Element Count   ${wip_currentlayouttitlesdisplayed_lctr}
    Log to console  ${layouttitledisplayedcount}
    Log  ${layouttitledisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${layouttitledisplayedcount}}
       ${LayouttitledisplayedText}=   get text    ${layouttitledisplayedlist}[${i}]
       Log to console  ${LayouttitledisplayedText}
       log  ${LayouttitledisplayedText}
    END

Get current reqmarkets displayed in the page
    Sleep  3s
    Wait Until Element Is Enabled   ${wip_currentreqmarketsdisplayed_lctr}
    @{reqmarketdisplayedlist}  Get WebElements  ${wip_currentreqmarketsdisplayed_lctr}
    ${reqmarketdisplayedcount}   Get Element Count   ${wip_currentreqmarketsdisplayed_lctr}
    Log to console  ${reqmarketdisplayedcount}
    Log  ${reqmarketdisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${reqmarketdisplayedcount}}
       ${reqLayoutmarketdisplayedText}=   get text    ${reqmarketdisplayedlist}[${i}]
       Log to console  ${reqLayoutmarketdisplayedText}
       log  ${reqLayoutmarketdisplayedText}
    END

Get current reqtitles displayed in the page
    Sleep  3s
    Wait Until Element Is Enabled   ${wip_currentreqtitlesdisplayed_lctr}
    @{reqtitledisplayedlist}  Get WebElements  ${wip_currentreqtitlesdisplayed_lctr}
    ${reqtitledisplayedcount}   Get Element Count   ${wip_currentreqtitlesdisplayed_lctr}
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
    Wait Until Element Is Enabled   ${wipLayoutmarketdropdownicon_lctr}
    Mouse down  ${wipLayoutmarketdropdownicon_lctr}
    Click element   ${wipLayoutmarketdropdownicon_lctr}
Get layout market list
    Sleep  3s
    Wait Until Element Is Enabled   ${wipLayoutmarketlist_lctr}
    @{layoutlist}  Get WebElements  ${wipLayoutmarketlist_lctr}
    ${layoutmarketcount}   Get Element Count   ${wipLayoutmarketlist_lctr}
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
    Wait Until Element Is Enabled   ${wipLayoutmarketlist_lctr}
    @{layoutlist}  Get WebElements  ${wipLayoutmarketlist_lctr}
    ${layoutmarketcount}   Get Element Count   ${wipLayoutmarketlist_lctr}
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
    Page Should Contain Element  ${wip_currentlayoutmarketsdisplayed_lctr}  Result present  Not Result present for filtered market
    Wait Until Element Is Enabled   ${wip_currentlayoutmarketsdisplayed_lctr}
    @{layoutmarketdisplayedlist}  Get WebElements  ${wip_currentlayoutmarketsdisplayed_lctr}
    ${layoutmarketdisplayedcount}   Get Element Count   ${wip_currentlayoutmarketsdisplayed_lctr}
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
    Wait Until Element Is Enabled   ${wipLayouttitledropdownicon_lctr}
    Click element   ${wipLayouttitledropdownicon_lctr}
Get layout title list
    Sleep  3s
    Wait Until Element Is Enabled   ${wipLayouttitlelist_lctr}
    @{layoutlist}  Get WebElements  ${wipLayouttitlelist_lctr}
    ${layouttitlecount}   Get Element Count   ${wipLayouttitlelist_lctr}
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
    Wait Until Element Is Enabled   ${wipLayouttitlelist_lctr}
    @{layoutlist}  Get WebElements  ${wipLayouttitlelist_lctr}
    ${layouttitlecount}   Get Element Count   ${wipLayouttitlelist_lctr}
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
    Page Should Contain Element  ${wip_currentlayouttitlesdisplayed_lctr}  Result present  Not Result present for filtered title
    Wait Until Element Is Enabled   ${wip_currentlayouttitlesdisplayed_lctr}
    @{layouttitledisplayedlist}  Get WebElements  ${wip_currentlayouttitlesdisplayed_lctr}
    ${layouttitledisplayedcount}   Get Element Count   ${wip_currentlayouttitlesdisplayed_lctr}
    Log to console  ${layouttitledisplayedcount}
    Log  ${layouttitledisplayedcount}
    FOR   ${i}    IN RANGE  0  ${${layouttitledisplayedcount}}
       ${LayouttitledisplayedText}=   get text    ${layouttitledisplayedlist}[${i}]
       Run Keyword If  '${LayouttitledisplayedText}' == '${Layouttitleinput}'  Log  Success  ELSE  Log  Layoutmarketfilterfail
       Log to console  ${LayouttitledisplayedText}
       log  ${LayouttitledisplayedText}
    END

#Requesting market drop down

Click Requesting market dropdown
    Sleep  7s
    Wait Until Element Is Enabled   ${wipRequestingmarketdropdownicon_lctr}
    Click element   ${wipRequestingmarketdropdownicon_lctr}
Get Requesting market list
    Sleep  3s
    Wait Until Element Is Enabled   ${wipRequestingmarketlist_lctr}
    @{layoutlist}  Get WebElements  ${wipRequestingmarketlist_lctr}
    ${Requestingmarketcount}   Get Element Count   ${wipRequestingmarketlist_lctr}
    Log to console  ${Requestingmarketcount}
    Log  ${Requestingmarketcount}
    FOR   ${i}    IN RANGE  0  ${${Requestingmarketcount}}
       ${RequestingmarketText}=   get text    ${layoutlist}[${i}]
       Log to console  ${RequestingmarketText}
       log  ${RequestingmarketText}
    END

Select Requesting market
    [Arguments]  ${requestingmarketinput}
    Sleep  3s
    Wait Until Element Is Enabled   ${wipRequestingmarketlist_lctr}
    @{reqmarketlist}  Get WebElements  ${wipRequestingmarketlist_lctr}
    ${reqmarketcount}   Get Element Count   ${wipRequestingmarketlist_lctr}
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
    Page Should Contain Element  ${wip_currentreqmarketsdisplayed_lctr}  Result present  Not Result present for filtered market
    Wait Until Element Is Enabled   ${wip_currentreqmarketsdisplayed_lctr}
    @{reqmarketdisplayedlist}  Get WebElements  ${wip_currentreqmarketsdisplayed_lctr}
    ${reqmarketdisplayedcount}   Get Element Count   ${wip_currentreqmarketsdisplayed_lctr}
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
    Wait Until Element Is Enabled   ${wipRequestingtitledropdownicon_lctr}
    Click element   ${wipRequestingtitledropdownicon_lctr}
Get Requesting title list
    Sleep  3s
    Wait Until Element Is Enabled   ${wipRequestingtitlelist_lctr}
    @{layoutlist}   Get WebElements  ${wipRequestingtitlelist_lctr}
    ${Requestingtitlecount}   Get Element Count   ${wipRequestingtitlelist_lctr}
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
    Wait Until Element Is Enabled   ${wipRequestingtitlelist_lctr}
    @{reqtitlelist}  Get WebElements  ${wipRequestingtitlelist_lctr}
    ${reqtitlecount}   Get Element Count   ${wipRequestingtitlelist_lctr}
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
    Page Should Contain Element  ${wip_currentreqtitlesdisplayed_lctr}  Result present  Not Result present for filtered market
    Wait Until Element Is Enabled   ${wip_currentreqtitlesdisplayed_lctr}
    @{reqtitledisplayedlist}  Get WebElements  ${wip_currentreqtitlesdisplayed_lctr}
    ${reqtitledisplayedcount}   Get Element Count   ${wip_currentreqtitlesdisplayed_lctr}
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


