*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locators.py

*** Variables ***
${elecount}  0
*** Keywords ***

Go to images page
    Wait Until Page Contains Element  ${Imagestabicon_lctr}  timeout=30s
    Click element  ${Imagestabicon_lctr}

Go to search tab
    Wait Until Page Contains Element  ${searchtab_lctr}  timeout=30s
    Click element  ${searchtab_lctr}

Click search text field
    Wait Until Page Contains Element  ${basicsearch_inputtextfield_lctr}  timeout=30s
    Click element   ${basicsearch_inputtextfield_lctr}

Enter search text
    [Arguments]  ${searchtext}
    Wait Until Page Contains Element  ${basicsearch_inputtextfield_lctr}  timeout=30s
    Input Text  ${basicsearch_inputtextfield_lctr}  ${searchtext}

Click search button
    Wait Until Page Contains Element  ${basicsearch_searchbutton_lctr}  timeout=30s
    Click element  ${basicsearch_searchbutton_lctr}

Click pleaseaddfilterokbutton and retry search
    Wait Until Page Contains Element  ${basicsearch_pleaseaddfilterokbutton_lctr}  timeout=30s
    Click button  ${basicsearch_pleaseaddfilterokbutton_lctr}
    Wait Until Page Contains Element   ${basicsearch_searchbutton_lctr}  timeout=30s
    Click element  ${basicsearch_searchbutton_lctr}
    Wait Until Page Contains Element   ${basicsearch_searchbutton_lctr}  timeout=30s
    Wait Until Element Is Visible  ${numberofresultlocator}  timeout=30s
    Capture Element Screenshot  ${numberofresultlocator}
Check if any result is getting fetched
    Wait Until Page Contains Element  ${firstsearchrsltrow_lctr}  timeout=30s  error=No search resultsPlease try again
    ${elecount}  Get Element Count  ${firstsearchrsltrow_lctr}
    [return]  ${elecount}

Verify successful search
    [Arguments]  ${searchinput}
    Wait Until Page Contains Element  ${firstsearchrsltrow_lctr}  timeout=30s
    Wait Until Page Contains Element   ${basicsearchresult_lctr}
    Element Should Contain  ${basicsearchresult_lctr}  ${searchinput}  True  True
    log  Success
Click clear button
    Wait Until Page Contains Element   ${basicsearchClearbutton_lctr}
    Click button  ${basicsearchClearbutton_lctr}
Check autosuggestion
    [Arguments]   ${searchtext}
    Wait Until Element Is Visible  ${basicsearch_autosuggestion_lctr}  timeout=30s
    #Sleep  5s
    Element Should Contain  ${basicsearch_autosuggestion_lctr}  ${searchtext}  True  True
    #@{textauto}  Get Text  ${autosuggestion}
    @{suggestions}  Get WebElements  ${basicsearch_autosuggestion_lctr}
    ${textautos}  Get Text  ${suggestions}[0]
    Log  ${textautos}
    Log To Console  ${textautos}
DoubleclickandcheckkeywordinADP
    [Arguments]   ${searchtext}
    Wait Until Page Contains Element  ${firstsearchresult_lctr}  timeout=30s
    Doubleclick element  ${firstsearchresult_lctr}
    Wait Until Page Contains Element  ${ADPHeight_lctr}  timeout=30s
    Page Should Contain  ${searchtext}
    Capture Page Screenshot
    Click element  ${searchtab_lctr}

