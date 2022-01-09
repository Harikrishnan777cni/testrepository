*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locators.py


*** Keywords ***

Go to extended search tab
    Wait Until Element Is Visible   ${extended_searchtab_lctr}  timeout=30s
    Click element  ${extended_searchtab_lctr}

Clear existing selections
    Wait Until Element Is Visible   ${extended_searchtab_lctr}  timeout=30s
    Click button  ${extended_clearselection_lctr}
Select contract checkbox
    Wait Until Element Is Visible  ${extended_contractedcreatorcontractcheckbox_lctr}
    Select Checkbox  ${extended_contractedcreatorcontractcheckbox_lctr}

Click Next button
    Wait Until Element Is Visible   ${extended_nextbuttoner_lctr}  timeout=30s
    Click button    ${extended_nextbuttoner_lctr}

clickaddcontractbutton
     Wait Until Element Is Visible   ${extended_addcontract_lctr}  timeout=30s
     Click button   ${extended_addcontract_lctr}
selectcontract
     Wait Until Element Is Visible   ${extended_contractcreatorname_lctr}  timeout=30s
     Double Click Element   ${extended_contractcreatorname_lctr}
clickaddcontractname
    Wait Until Element Is Visible   ${extended_contractname_lctr}  timeout=30s
    ${adp_contractname}  Get Text  ${extended_contractname_lctr}
    Click Element   ${extended_contractname_lctr}
clickokbutton
    Wait Until Element Is Visible   ${extended_okbutton_lctr}  timeout=30s
    Click Button   ${extended_okbutton_lctr}
clickFinishbutton
    Wait Until Element Is Visible   ${extended_finishbutton_lctr}  timeout=30s
    Click Button   ${extended_finishbutton_lctr}
    Wait Until Element Is Visible  ${numberofresultlocator}  timeout=30s

Verify extended search result
    [Arguments]  ${contractname}
    Wait Until Element Is Visible   ${extended_extendassetresult_lctr}  timeout=30s
    Double click element  ${extended_extendassetresult_lctr}
    Wait Until Element Is Visible  ${ADPHeight_lctr}  timeout=30s
    Page Should Contain  ${contractname}
    Capture Page Screenshot









