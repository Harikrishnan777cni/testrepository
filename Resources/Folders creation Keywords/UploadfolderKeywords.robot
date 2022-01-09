*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ../../Resources/Login Keywords/LoginKeywords.robot
Resource  ../../Resources/Search Keywords/BasicsearchKeywords.robot

*** Keywords ***
Select folder type
    Wait Until Page Contains Element   ${commissionedfoldertype_lctr}  timeout=30s
    Mouse Down    ${commissionedfoldertype_lctr}
Open Context Menu for folder type
    Wait Until Page Contains Element   ${commissionedfoldertype_lctr}  timeout=30s
    Click element  ${commissionedfoldertype_lctr}
    Open Context Menu  ${commissionedfoldertype_lctr}

Click on blankspace
    Wait Until Page Contains Element   ${blankspaceupload_lctr}  timeout=30s
    Open Context Menu  ${blankspaceupload_lctr}

Select create uploadfolder option
    Wait Until Element is Visible   ${numberoffolders_lctr}   timeout=30s
    Wait Until Element is Visible   ${createuploadfolderoption_lctr}  timeout=30s
    Mouse Over  ${createuploadfolderoption_lctr}
    Click link   ${createuploadfolderoption_lctr}
    #Mouse Up  ${createuploadfolderoption_lctr}

Input uploadfolder name and finish
    ${uploadfoldername_input}  Generate Random String  8  [LETTERS]
    Wait Until Page Contains Element   ${uploadfoldernamefield_lctr}  timeout=30s
    Input text  ${uploadfoldernamefield_lctr}   ${uploadfoldername_input}
    Wait Until Element is Visible   ${nextbutton_upload_lctr}  timeout=30s
    Mouse over  ${nextbutton_upload_lctr}
    Click button    ${nextbutton_upload_lctr}
    Wait Until Page Contains Element   ${finishbutton_upload_lctr}  timeout=30s
    Click button    ${finishbutton_upload_lctr}
    Wait Until Page Contains Element  xpath://div[@class='x-grid3-cell-inner x-grid3-col-2' and text()='${uploadfoldername_input}']  timeout=30s
    Wait Until Keyword Succeeds  3x  4s    Capture Element Screenshot  xpath://div[@class='x-grid3-cell-inner x-grid3-col-2' and text()='${uploadfoldername_input}']
    [Return]  ${uploadfoldername_input}

Verify upload folder creation
    [Arguments]  ${uploadfoldername}
    Wait Until Element Is Enabled   ${uploadfolderlist_lctr}
    Element should contain  ${uploadfolderlist_lctr}  ${uploadfoldername}


