*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locatorsset2.py
Library  String

*** Keywords ***

Go to images page
    Wait Until Page Contains Element  ${Imagestabicon_lctr}  timeout=30s
    Click element  ${Imagestabicon_lctr}


Go to Imagestab
    Wait Until Page Contains Element   ${Imagestab_lctr}  timeout=30s
    Click element   ${Imagestab_lctr}

Go to my folder tab
    Wait Until Page Contains Element  ${myfoldertab_lctr}  timeout=30s
    Click Element    ${myfoldertab_lctr}

#ownmarketonly
Go to public folder
    Wait Until Element Is Enabled   ${own_publicfolder_lctr}
    Click element   ${own_publicfolder_lctr}

#differentmarketonly
Go to CNIfolder
    Wait Until Page Contains Element   ${diffmarket_CNIfolder_lctr}  timeout=30s
    Double Click element   ${diffmarket_CNIfolder_lctr}


Go to Marketfolder
    [Arguments]  ${markettestinput}
    Click element  ${display_all_lctr}
    ${diffmarket_Marketfolder_lctr} =  Set Variable  xpath://div[text()='${markettestinput[0]}']/parent::td
    Wait Until Page Contains Element   ${diffmarket_Marketfolder_lctr}  timeout=30s
    Scroll Element Into View  ${diffmarket_Marketfolder_lctr}
    Mouse down  ${diffmarket_Marketfolder_lctr}
    Sleep  2s
    Double Click element   ${diffmarket_Marketfolder_lctr}


Go to Titlefolder
    [Arguments]  ${markettestinput}
    ${diffmarket_Titlefolder_lctr}  Set Variable  xpath://div[text()='${markettestinput[1]}']/parent::td
    Wait Until Page Contains Element   ${diffmarket_Titlefolder_lctr}  timeout=30s
    Scroll Element Into View  ${diffmarket_Titlefolder_lctr}
    Mouse down  ${diffmarket_Titlefolder_lctr}
    Sleep  2s
    Double Click element   ${diffmarket_Titlefolder_lctr}

#differentmarketonly
Check whether Commissioned, Non-Commissioned, Studio folders not acessible
    Element Should Not Contain  ${uploadfolderlist_lctr}  commissioned
    Element Should Not Contain  ${uploadfolderlist_lctr}  non-commissioned
    Element Should Not Contain  ${uploadfolderlist_lctr}  studio

Go to diff_Public folder
    [Arguments]  ${markettestinput}
    ${different_publicfolder_lctr}   Set Variable   xpath://div[text()='${markettestinput[2]}']/parent::td
    Wait Until Page Contains Element   ${different_publicfolder_lctr}  timeout=30s
    Sleep  2s
    Double Click element   ${different_publicfolder_lctr}


Go to year folder
    [Arguments]  ${markettestinput}
    ${different_yearfolder_lctr}  Set Variable   xpath://div[text()='${markettestinput[3]}']/parent::td
    Wait Until Element Is Visible   ${different_yearfolder_lctr}  timeout=30s
    Scroll Element Into View  ${different_yearfolder_lctr}
    Mouse down  ${different_yearfolder_lctr}
    Sleep  2s
    Double Click Element  ${different_yearfolder_lctr}

Go to issue folder
    [Arguments]  ${markettestinput}
    ${different_sectionfolder_lctr}   Set Variable   xpath://div[text()='${markettestinput[4]}']/parent::td
    Wait Until Element Is Visible   ${different_sectionfolder_lctr}  timeout=30s
    Scroll Element Into View  ${different_sectionfolder_lctr}
    Mouse down  ${different_sectionfolder_lctr}
    Sleep  2s
    Double Click Element   ${different_sectionfolder_lctr}

Go to print folder
    [Arguments]  ${markettestinput}
    ${different_printfolder_lctr}  Set Variable   xpath://div[text()='${markettestinput[5]}']/parent::td
    Wait Until Element Is Visible   ${different_printfolder_lctr}  timeout=30s
    Mouse down  ${different_printfolder_lctr}
    Sleep  2s
    Double Click Element   ${different_printfolder_lctr}

Go to section folder
    [Arguments]  ${markettestinput}
    ${different_layoutparentfolder_lctr}  Set Variable   xpath://div[text()='${markettestinput[6]}']/parent::td
    Wait Until Element Is Visible   ${different_layoutparentfolder_lctr}  timeout=30s
    Scroll Element Into View  ${different_layoutparentfolder_lctr}
    Mouse down  ${different_layoutparentfolder_lctr}
    Sleep  2s
    Double Click Element   ${different_layoutparentfolder_lctr}

Go to layout folder
    [Arguments]  ${markettestinput}
    ${different_layoutchildfolder_lctr}  Set Variable   xpath://div[text()='${markettestinput[7]}']/parent::td
    Wait Until Element Is Visible   ${different_layoutchildfolder_lctr}  timeout=30s
    Scroll Element Into View  ${different_layoutchildfolder_lctr}
    Mouse down  ${different_layoutchildfolder_lctr}
    Sleep  2s
    Double Click Element   ${different_layoutchildfolder_lctr}

Go to assetfolder
    [Arguments]  ${markettestinput}
    ${different_assetsfolder_lctr}  Set Variable   xpath://div[text()='${markettestinput[8]}']/parent::td
    Wait Until Element Is Visible   ${different_assetsfolder_lctr}  timeout=30s
    Scroll Element Into View  ${different_assetsfolder_lctr}
    Mouse down  ${different_assetsfolder_lctr}
    Sleep  2s
    Double Click Element   ${different_assetsfolder_lctr}

Go to publishertypefolder
    [Arguments]  ${markettestinput}
    ${different_unknownfolder_lctr}  Set Variable  xpath://div[text()='${markettestinput[9]}']/parent::td
    Wait Until Element Is Visible   ${different_unknownfolder_lctr}  timeout=30s
    Scroll Element Into View  ${different_unknownfolder_lctr}
    Mouse down  ${different_unknownfolder_lctr}
    Sleep  2s
    Double Click Element   ${different_unknownfolder_lctr}

Go to ingestedfolder
    [Arguments]  ${markettestinput}
    ${different_ingestedfolder_lctr}  Set Variable  xpath://div[text()='${markettestinput[10]}']/parent::td
    Wait Until Element Is Visible   ${different_ingestedfolder_lctr}  timeout=30s
    Scroll Element Into View  ${different_ingestedfolder_lctr}
    Mouse down  ${different_ingestedfolder_lctr}
    Sleep  2s
    Double Click Element   ${different_ingestedfolder_lctr}


Go to asset
    [Arguments]  ${markettestinput}
    ${different_asset_lctr}  Set Variable  xpath://div[text()='${markettestinput[11]}']
    Wait Until Element Is Visible   ${different_asset_lctr}  timeout=30s
    Scroll Element Into View  ${different_asset_lctr}
    Mouse down  ${different_asset_lctr}
    Sleep  2s
    Double Click Element   ${different_asset_lctr}

Check asset thumbnail
    [Arguments]  ${markettestinput}
    ${different_assetthumbnail_lctr}  Set Variable  xpath://img[contains(@src,'${markettestinput[11]}')and contains(@src,'thumb.319.319')]
    Wait Until Element Is Visible   ${different_assetthumbnail_lctr}  timeout=30s
    ${trunkimagesize}  Get Element Size   ${different_assetthumbnail_lctr}
    log   ${trunkimagesize}

#differentmarketonly
Check productiondigitallink is not present on trunk
    Page Should Not Contain Link  ${own_productiondigitallink_lctr}
    Page Should Not Contain  Download
    Page Should Not Contain  Download productiondigital

#differentmarketonly
Check downloadoriginalrenditionlink is not present on trunk
    Page Should Not Contain Link  ${own_downloadtrunk_lctr}

#ownmarketonly
Check productiondigitallink is present on trunk
    Page Should Contain Link  ${own_productiondigitallink_lctr}
    Capture Element Screenshot  ${own_productiondigitallink_lctr}

#ownmarketonly
Check downloadoriginalrenditionlink is present on trunk
    [Arguments]   ${markettestinput}
    ${own_downloadtrunk_lctr}  Set Variable  xpath:(//a[@title='Download' and contains(@href,'${markettestinput[11]}')])
    Page Should Contain Link  ${own_downloadtrunk_lctr}
    Capture Element Screenshot  ${own_downloadtrunk_lctr}

Expand branch
    [Arguments]   ${markettestinput}
    ${different_branchexpandbutton_lctr}  Set Variable  xpath:(//div[@class='x-layout-collapsed x-layout-collapsed-east x-layout-cmini-east' and contains(@id,'${markettestinput[11]}')])
    Wait Until Element is Visible   ${different_branchexpandbutton_lctr}  timeout=30s
    Wait Until Element is Enabled  ${different_branchexpandbutton_lctr}  timeout=30s
    Click Element   ${different_branchexpandbutton_lctr}


Check branch thumbnail
    [Arguments]  ${markettestinput}
    ${different_branchthumbnail_lctr}  Set Variable  xpath://img[contains(@src,'${markettestinput[11]}')and contains(@src,'_jcr_content/renditions/thumbnail_branch')]
    Wait Until Element Is Visible   ${different_branchthumbnail_lctr}  timeout=30s
    ${branchimagesize}  Get Element Size   ${different_branchthumbnail_lctr}
    log   ${branchimagesize}

#differentmarketonly
Check downloadproductionlink is not present on branch
    Page Should Not Contain Link   ${own_downloadproduction_branch_lctr}

#ownmarketonly
Check downloadproductionlink is present on branch
    [Arguments]   ${markettestinput}
    ${own_downloadproduction_branch_lctr}  Set Variable  xpath:(//a[text()='Download production' and contains(@href,'${markettestinput[11]}')])
    Page Should Contain Link   ${own_downloadproduction_branch_lctr}
    Capture Element Screenshot  ${own_downloadproduction_branch_lctr}
