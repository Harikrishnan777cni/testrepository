*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locators.py
Variables  ../../PageObjects/Locatorsset2.py

*** Keywords ***

Go to Publications tab
    Wait Until Page Contains Element  ${Publicationstab_lctr}  timeout=30s
    Click element  ${Publicationstab_lctr}

Go to Publications search tab
    Wait Until Page Contains Element  ${Publicationssearchtab_lctr}  timeout=30s
    Click element  ${Publicationssearchtab_lctr}

Enter Publications search text
    [Arguments]  ${Publicationssearch_input}
    Wait Until Page Contains Element  ${Publicationssearchtextfield_lctr}  timeout=30s
    Input Text  ${Publicationssearchtextfield_lctr}  ${Publicationssearch_input}

Enter Publications search button
    Wait Until Page Contains Element  ${Publicationssearchbutton_lctr}  timeout=30s
    Click element  ${Publicationssearchbutton_lctr}
    Wait Until Page Does Not Contain Element  ${Publications_noresult_lctr}  timeout=30s  error=No search resultsPlease try again

Verify successful publication search
    [Arguments]  ${searchinput}

    Wait Until Page Contains Element   ${firstpublicationsearchresult_lctr}  timeout=30s
    Element Should Contain  ${Publicationsresultdiv_lctr}  ${searchinput}  True  True
    log  Success

DoubleclickandcheckkeywordinPDP
    [Arguments]   ${searchtext}
    Wait Until Page Contains Element   ${firstpublicationsearchresult_lctr}  timeout=30s
    Doubleclick element  ${firstpublicationsearchresult_lctr}
    Wait Until Page Contains Element  ${Pagespane_lctr}  timeout=30s
    Page Should Contain  ${searchtext}
    Capture Page Screenshot

Click pleaseaddfilterokbutton and retry search for publication search
    Wait Until Page Contains Element  ${basicsearch_pleaseaddfilterokbutton_lctr}  timeout=30s
    Click button  ${basicsearch_pleaseaddfilterokbutton_lctr}
    Wait Until Page Contains Element   ${basicsearch_searchbutton_lctr}  timeout=30s
    Click element  ${basicsearch_searchbutton_lctr}
    Wait Until Page Contains Element   ${basicsearch_searchbutton_lctr}  timeout=30s
    Wait Until Element Is Visible  ${publicationnumberofresultlocator}  timeout=30s  error=Search timeout.Please search for more specific keyword
    Capture Page Screenshot
