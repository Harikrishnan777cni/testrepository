*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locators.py


*** Keywords ***

Go to fashion search tab
    Wait Until Page Contains Element  ${Fashionshowsearch_lctr}  timeout=30s
    #Mouse Down    ${Fashionshowsearch}
    Click element  ${Fashionshowsearch_lctr}

Enter fashionshow search text
    [Arguments]  ${Fashionshowinput}
    Wait Until Page Contains Element   ${Fashionshowtext_lctr}
    Input Text  ${Fashionshowtext_lctr}    ${Fashionshowinput}

Select Search button

    Click Button  ${Fashionshowsearchbutton_lctr}
    Wait Until Page Contains Element  ${numberofresultlocator}  timeout=30s
    #Capture Element Screenshot  ${numberofresultlocator}
Check fashionshow search result
    [Arguments]  ${searchinput1}
    Wait Until Page Contains Element  ${numberofresultlocator}  timeout=30s
    Element Should Contain  ${Divsearchresult_lctr}  ${searchinput1}

DoubleclickandcheckkeywordinfashionADP
    [Arguments]   ${searchtext}
    Wait Until Page Contains Element  ${firstsearchresult_lctr}  timeout=30s
    Doubleclick element  ${firstsearchresult_lctr}
    Wait Until Page Contains Element  ${ADPshow_lctr}  timeout=30s
    Page Should Contain  ${searchtext}
    Capture Page Screenshot
    Click element  ${searchtab_lctr}