*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locators.py


*** Keywords ***

Go to advanced search tab
    Wait Until Page Contains Element  ${advanced_searchtab_lctr}   timeout=30s
    Click element  ${advanced_searchtab_lctr}

Enter advanced search text
    [Arguments]  ${advsearchinput}
    Wait Until Page Contains Element   ${advanced_inputtextfield_lctr}  timeout=30s
    Input Text  ${advanced_inputtextfield_lctr}    ${advsearchinput}
Select folder type checkbox
     Wait Until Element Is Enabled   ${advanced_foldertypecheckbox_lctr}
     Select Checkbox    ${advanced_foldertypecheckbox_lctr}

Select ragstatuscheckbox
     Wait Until Page Contains Element   ${advanced_ragstatuscheckbox_lctr}  timeout=30s
     Select Checkbox    ${advanced_ragstatuscheckbox_lctr}
Select Search button
     Click Button  ${advanced_searchbutton_lctr}

Check search result
    [Arguments]  ${advsearchinput}
    Wait Until Page Contains Element  ${firstsearchrsltrow_lctr}  timeout=30s
    Wait Until Page Contains Element   ${basicsearchresult_lctr}  timeout=30s
    Page Should Contain Element  ${advanced_ragstatusxpath_lctr}
    Page Should Contain Element  ${advanced_commissionedicon}
    Element Should Contain  ${basicsearchresult_lctr}  ${advsearchinput}  True  True

DoubleclickandcheckkeywordandraginADP
    [Arguments]   ${searchtext}
    Wait Until Page Contains Element  ${firstsearchresult_lctr}  timeout=30s
    Doubleclick element  ${firstsearchresult_lctr}
    Wait Until Page Contains Element  ${ADPHeight_lctr}  timeout=30s
    Capture Page Screenshot
    Page Should Contain Element  ${advanced_ragstatus_adp}
    Page Should Contain Element  ${advanced_commissionedicon}
    Page Should Contain  ${searchtext}
    Capture Page Screenshot
    Click element  ${searchtab_lctr}