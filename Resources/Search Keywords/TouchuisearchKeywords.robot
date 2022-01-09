*** Settings ***
Library  SeleniumLibrary
Library  String
Variables  ../../PageObjects/Locators.py


*** Keywords ***

Go to Touchui tab
    Wait Until Page Contains Element  ${Touchuitab_lctr}  timeout=30s
    Click element  ${Touchuitab_lctr}
Close Productnavigation
    Wait Until Page Contains Element   ${Productnavigationclosebutton_lctr}  timeout=30s
    Click element  ${Productnavigationclosebutton_lctr}
Click Touchui search icon
    Wait Until Page Contains Element   ${TouchuiSearchicon_lctr}  timeout=30s
    Click element  ${TouchuiSearchicon_lctr}

Input search text in Touch UI
    [Arguments]  ${Touchuisearch_input}
    Wait Until Page Contains Element    ${Touchuisearchtextfield_lctr}  timeout=30s
    Input Text  ${Touchuisearchtextfield_lctr}  ${Touchuisearch_input}

Check omnisearchsuggestions
    [Arguments]   ${omnisearchtext}
    Wait Until Element is Visible  ${touchuiomnisearchsuggestions_lctr}  timeout=30s
    Element Should Contain  ${touchuiomnisearchsuggestions_lctr}  ${omnisearchtext}  True  True
    @{omnisuggestions}  Get WebElements  ${touchuiomnisearchsuggestions_lctr}
    ${textautos}  Get Text  ${omnisuggestions}[0]
    Log  ${textautos}
    Log To Console  ${textautos}

Click blank space
    Wait Until Page Contains Element    ${Blankspacetouchui_lctr}  timeout=30s
    Click element  ${Blankspacetouchui_lctr}
    Wait Until Element is Visible  ${touchuinumberofresults_lctr}

Check results
    [Arguments]   ${Touchui_result}
    Wait Until Page Contains Element  ${touchuiomnisearchresult_lctr}  timeout=30s
    Element Should Contain  ${touchuiomnisearchresult_lctr}  ${Touchui_result}  True  True

Click leftbar
    Wait Until Page Contains Element   ${leftbar_lctr}  timeout=30s
    Wait Until Element Is Enabled  ${leftbar_lctr}  timeout=30s
    Mouse Over  ${leftbar_lctr}
    Click element  ${leftbar_lctr}
Select Filters
    Wait Until Page Contains Element   ${touchuirightstatusfilter_lctr}  timeout=30s
    Click element  ${touchuirightstatusfilter_lctr}
Select File Type
    Wait Until Page Contains Element   ${Filetype_lctr}  timeout=30s
    Click element  ${Filetype_lctr}
Select Images checkbox
    Wait Until Page Contains Element   ${touchuiimagescheckbox_lctr}  timeout=30s
    Select Checkbox  ${touchuiimagescheckbox_lctr}
Select rightstatus filter
    Wait Until Page Contains Element   ${touchuirightstatusfilter_lctr}  timeout=30s
    Click element  ${touchuirightstatusfilter_lctr}
Select Reqapprovalcheckbox
    Wait Until Page Contains Element   ${Reqapprovalcheckbox_lctr}  timeout=30s
    Scroll Element Into View  ${Reqapprovalcheckbox_lctr}
    Click element  ${Reqapprovalcheckbox_lctr}
Check filtered results
    [Arguments]   ${filter_result1}  ${filter_result2}  ${filter_result3}
    Wait Until Page Contains Element   ${touchuiomnisearchresult_lctr}  timeout=30s
    Element Should Contain  ${touchuiomnisearchresult_lctr}  ${filter_result1}
    Element Should Not Contain  ${touchuiomnisearchresult_lctr}  ${filter_result2}
    Element Should Not Contain  ${touchuiomnisearchresult_lctr}  ${filter_result3}

ClickinfoandcheckkeywordinADP
    [Arguments]  ${searchinput1}
    Wait Until Page Contains Element  ${touchuifirstsearchresult_lctr}
    Mouse Over  ${touchuifirstsearchresult_lctr}
    Sleep  5s
    Wait Until Element is visible  ${touchuiinfoicon_lctr}
    Mouse down  ${touchuiinfoicon_lctr}
    Mouse up  ${touchuiinfoicon_lctr}
    Wait Until Page Contains Element  ${touchuimetadata_lctr}
    @{test}   Get WebElements  ${assetformidfieldsvalues_lctr}
    ${count}  Get Element Count  ${assetformidfieldsvalues_lctr}
    Log  ${count}
    FOR   ${i}    IN RANGE  0  ${${count}}
       ${status}  Run Keyword And Return Status  Page Should Contain  ${searchinput1}
       Exit For Loop IF    '${status}' == 'True'
       ${ValueText}   Get Value   ${test}[${i}]
       log  ${ValueText}
       ${StringValueText}  Convert To Lower Case  ${ValueText}
       ${comparetext}  Convert To Lower Case  ${searchinput1}
       ${status}  Run Keyword And Return Status  Should Contain    ${StringValueText}  ${comparetext}  ignore_case = True
       Exit For Loop IF    '${status}' == 'True'
    END
    Run Keyword If  '${status}' == 'True'  Log  keyword found  ELSE  FAIL
    Go Back
    Wait Until Element is visible  ${touchuinumberofresults_lctr}  timeout=30s

