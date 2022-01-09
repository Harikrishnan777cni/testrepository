*** Settings ***
Library  SeleniumLibrary
Library  String
Variables  ../../PageObjects/Locators.py

*** Keywords ***
Go to my folder tab
    Wait Until Page Contains Element  ${myfoldertab_lctr}  timeout=30s
    Click Element    ${myfoldertab_lctr}
Go to fixed folder
    Wait Until Page Contains Element   ${fixedfolder_lctr}  timeout=30s
    Double Click Element    ${fixedfolder_lctr}
Open Context Menu for fixed folder
    Wait Until Page Contains Element   ${fixedfolder_lctr}  timeout=30s
    Open Context Menu  ${fixedfolder_lctr}
Select create featurefolder option
    Wait Until Element is Visible   ${numberoffolders_lctr}   timeout=30s
    #Capture Element Screenshot  ${numberoffolders_lctr}  timeout=30s
    Wait Until Element is Visible   ${createfeaturefolderoption_lctr}  timeout=30s
    Mouse over   ${createfeaturefolderoption_lctr}
    Click link  ${createfeaturefolderoption_lctr}
    #Mouse up  ${createfeaturefolderoption_lctr}
Input featurefolder name and click finish button
    ${featurefoldername_input}  Generate Random String  8  [LETTERS]
    Wait Until Page Contains Element   ${featurefoldernamefield_lctr}  timeout=30s
    Input text  ${featurefoldernamefield_lctr}   ${featurefoldername_input}
    Wait Until Page Contains Element   ${finishbutton_lctr}  timeout=30s
    Click button    ${finishbutton_lctr}
    Wait Until Page Contains Element  xpath://div[@class='x-grid3-cell-inner x-grid3-col-2' and text()='${featurefoldername_input}']    timeout=30s
    Wait Until Keyword Succeeds  3x  4s    Capture Element Screenshot  xpath://div[@class='x-grid3-cell-inner x-grid3-col-2' and text()='${featurefoldername_input}']
    [Return]  ${featurefoldername_input}

Verify feature folder creation
    [Arguments]  ${featurefoldername}
    Wait Until Page Contains Element   ${uploadfolderlist_lctr}  timeout=30s
    Element should contain  ${uploadfolderlist_lctr}  ${featurefoldername}






