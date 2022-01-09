*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locatorsset2.py

*** Variables ***
@{marketorigtitles}  China  CNI Technology  Germany  Spain  France  India  Italy  Japan  Mexico  Russia  Taiwan  UK  USA
@{titleorigtitles}  Baku  Brides  Easy Living  Ferrari  Glamour  GQ  GQ Active  GQ Style  House and Garden  Love  Mandarin Oriental  Salt  Tatler  Traveller  Vanity Fair  Vogue  Wired  World Of Interiors
*** Keywords ***
Select publications from the csvfile
    [Arguments]  ${publicationfolders}
    FOR   ${marketlist}  IN  @{publicationfolders}
        Wait Until Keyword Succeeds  3x  4s   Select Editions tab
        Wait Until Keyword Succeeds  3x  4s   Select All editions
        #Wait Until Keyword Succeeds  3x  4s   Check Publicationsmarket
        Wait Until Keyword Succeeds  3x  4s   Select Publicationsmarket  ${marketlist}
        #Check Publicationstitle
        Wait Until Keyword Succeeds  3x  4s   Select PublicationsTitle  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s   Select Publicationsyear  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s   Select Publications issuename  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s   Select Publications layoutname  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s   Select Publicationspdfname  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s   Check layout thumbnail  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s   Check Downloadlayoutlink is present  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s   Check Pages pane is present  ${marketlist}
        Wait Until Keyword Succeeds  3x  4s   Check Assets pane is present  ${marketlist}
    END

Go to Publications tab
    Wait Until Page Contains Element  ${Publicationstab_lctr}  timeout=30s
    Click element  ${Publicationstab_lctr}

Select Editions tab
    Sleep  3s
    Wait Until Page Contains Element   ${Editionstab_lctr}  timeout=30s
    Click element  ${Editionstab_lctr}

Select All editions
    Sleep  3s
    Wait Until Page Contains Element   ${AllEditions_lctr}  timeout=30s
    Click element  ${AllEditions_lctr}

Select Publicationsmarket
    Sleep  3s
    [Arguments]  ${markettestinput}
    ${PublicationsMarket_lctr}  Set Variable    xpath://span[text()='${markettestinput[0]}']
    Wait Until Page Contains Element   ${PublicationsMarket_lctr}  timeout=30s
    Click element  ${PublicationsMarket_lctr}

Check Publicationsmarket
    Sleep  3s
    Wait Until Page Contains Element  ${PublicationsMarketlist_lctr}   timeout=30s
    ${AllMarketsCount}   Get Element Count  ${PublicationsMarketlist_lctr}
    @{MarketItems}  Get WebElements  ${PublicationsMarketlist_lctr}
    log to console  ${AllMarketsCount}
    log  ${AllMarketsCount}
    FOR   ${i}    IN RANGE  0  ${${AllMarketsCount}}
       ${MarketText}=   get text    ${MarketItems}[${i}]

       Log to console  ${MarketText}
       log  ${MarketText}
       Log   ${marketorigtitles}[${i}]
       Log  ${MarketText}
       Run Keyword If  '${marketorigtitles}[${i}]' == '${MarketText}'  Log  pass  ELSE  FAIL

    END

Check Publicationstitle
    Sleep  3s
    Wait Until Page Contains Element  ${PublicationsTitlelist_lctr}   timeout=30s
    ${AllMarkettitlesCount}   Get Element Count  ${PublicationsTitlelist_lctr}
    @{MarkettitlesItems}  Get WebElements  ${PublicationsTitlelist_lctr}
    log to console  ${AllMarkettitlesCount}
    log  ${AllMarkettitlesCount}
    FOR   ${i}    IN RANGE  0  ${${AllMarkettitlesCount}}
       ${MarketTitleText}=   get text    ${MarkettitlesItems}[${i}]

       Log to console  ${MarketTitleText}
       log  ${MarketTitleText}
       log  ${titleorigtitles}[${i}]
       Run Keyword If  '${titleorigtitles}[${i}]' == '${MarketTitleText}'  Log  pass  ELSE  FAIL

    END

Select PublicationsTitle
    Sleep  3s
    [Arguments]  ${markettestinput}
    ${PublicationsTitle_lctr}  Set Variable    xpath://span[text()='${markettestinput[1]}']
    Wait Until Page Contains Element   ${PublicationsTitle_lctr}  timeout=30s
    Click element  ${PublicationsTitle_lctr}

Select Publicationsyear
    Sleep  3s
    [Arguments]  ${markettestinput}
    ${Publicationsyear_lctr}  Set Variable    xpath://span[text()='${markettestinput[2]}']
    Wait Until Page Contains Element   ${Publicationsyear_lctr}  timeout=30s
    Click element  ${Publicationsyear_lctr}

Select Publications issuename
    Sleep  3s
    [Arguments]  ${markettestinput}
    ${Publicationsissuename_lctr}  Set Variable    xpath://span[text()='${markettestinput[3]}']
    Wait Until Page Contains Element   ${Publicationsissuename_lctr}  timeout=30s
    Scroll Element Into View     ${Publicationsissuename_lctr}
    Click element  ${Publicationsissuename_lctr}

Select Publications layoutname
    Sleep  3s
    [Arguments]  ${markettestinput}
    ${Publicationslayoutname_lctr}   Set Variable   xpath://span[text()='${markettestinput[4]}']
    Wait Until Page Contains Element   ${Publicationslayoutname_lctr}  timeout=30s
    Scroll Element Into View     ${Publicationslayoutname_lctr}
    Double Click element  ${Publicationslayoutname_lctr}

Select Publicationspdfname
    Sleep  3s
    [Arguments]  ${markettestinput}
    ${Publicationspdfname_lctr}  Set Variable    xpath://span[text()='${markettestinput[5]}']
    Wait Until Page Contains Element   ${Publicationspdfname_lctr}  timeout=30s
    Scroll Element Into View    ${Publicationspdfname_lctr}
    Double Click element  ${Publicationspdfname_lctr}

Check layout thumbnail
    Sleep  3s
    [Arguments]  ${markettestinput}
    ${Layoutthumbnail_lctr}  Set Variable    xpath://img[contains(@src,'${markettestinput[6]}.thumb.319.319')]
    Wait Until Page Contains Element   ${Layoutthumbnail_lctr}  timeout=30s
    Get Element Size  ${Layoutthumbnail_lctr}

Check Downloadlayoutlink is present
     [Arguments]  ${markettestinput}
     ${Downloadlayoutlink_lctr}  Set Variable    xpath://a[text()='Download layout'and contains(@title,'${markettestinput[6]}')]
     Wait Until Page Contains Element   ${Downloadlayoutlink_lctr}  timeout=30s
     Page Should Contain Link  ${Downloadlayoutlink_lctr}
     Capture Element Screenshot  ${Downloadlayoutlink_lctr}

Check Pages pane is present
    [Arguments]  ${markettestinput}
    ${Pagespane_lctr}  Set Variable    xpath://div[contains(@id,'${markettestinput[6]}-pages-pubdataviewpanel')]/div/span[text()='Pages']
    Wait Until Page Contains Element   ${Pagespane_lctr}  timeout=30s
    Page Should Contain Element  ${Pagespane_lctr}
    Capture Element Screenshot  ${Pagespane_lctr}

Check Assets pane is present
    [Arguments]  ${markettestinput}
    ${Assetspane_lctr}  Set Variable    xpath://div[contains(@id,'${markettestinput[6]}-assets-pubdataviewpanel')]/div/span[text()='Assets']
    Wait Until Page Contains Element   ${Assetspane_lctr}  timeout=30s
    Page Should Contain Element  ${Assetspane_lctr}
    Capture Element Screenshot  ${Assetspane_lctr}



