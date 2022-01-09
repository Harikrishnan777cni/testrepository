*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locatorsset2.py
Resource  ../../Resources/Assetnavigation Keywords/Differentmarketpublicassetnavigationkeywords.robot
Library  ../../CustomLibs/Csv.py
Library  String
*** Keywords ***



Go to images page
    Wait Until Page Contains Element  ${Imagestabicon_lctr}  timeout=30s
    Click element  ${Imagestabicon_lctr}


Go to Imagestab
    Sleep  3s
    Wait Until Page Contains Element   ${Imagestab_lctr}  timeout=30s
    Click element   ${Imagestab_lctr}

#diffmarketonly
Go to folders tab
    Sleep  3s
    Wait Until Page Contains Element  ${foldertab_lctr}  timeout=30s
    Click Element    ${foldertab_lctr}

#ownmarketonly
Go to sharedwip folder
    Sleep  3s
    Wait Until Element Is Enabled   ${own_sharedwipfolder_lctr}
    Click element   ${own_sharedwipfolder_lctr}

#ownmarketonly
Go to highresolution folder
    Sleep  3s
    Wait Until Element is Visible   ${own_highresfolder_lctr}  timeout=30s
    Double Click Element  ${own_highresfolder_lctr}

#diffmarketonly
Go to HIGHRES folder
    Sleep  3s
    [Arguments]  ${markettestinput}

    ${different_publicfolder_lctr}   Set Variable   xpath://div[text()='${markettestinput[3]}']
    Wait Until Page Contains Element   ${different_publicfolder_lctr}  timeout=30s
    Sleep  2s
    Double Click element   ${different_publicfolder_lctr}

#diffmarketonly
Go to diff_sharedwip folder
    Sleep  3s
    [Arguments]  ${markettestinput}

    ${different_publicfolder_lctr}   Set Variable   xpath://div[text()='${markettestinput[2]}']
    Wait Until Page Contains Element   ${different_publicfolder_lctr}  timeout=30s
    Double Click element   ${different_publicfolder_lctr}

Go to sharedwipsection folder
    Sleep  3s
    [Arguments]  ${markettestinput}

    ${own_sharedwipsectionfolder_lctr}  Set Variable  xpath://div[text()='${markettestinput[4]}']
    Wait Until Page Contains Element   ${own_sharedwipsectionfolder_lctr}  timeout=30s
    Double Click Element   ${own_sharedwipsectionfolder_lctr}

Go to feature folder
    Sleep  3s
    [Arguments]  ${markettestinput}

    #Scroll Element Into View  ${printfolder}
    ${own_featurefolder_lctr}  Set Variable  xpath://div[text()='${markettestinput[5]}']
    Wait Until Page Contains Element   ${own_featurefolder_lctr}  timeout=30s
    Double Click Element   ${own_featurefolder_lctr}
Go to sharedassets folder
    Sleep  3s
    [Arguments]  ${markettestinput}

    #Scroll Element Into View  ${sectionfolder}
    ${own_sharedassetsfolder_lctr}  Set Variable  xpath://div[text()='${markettestinput[6]}']
    Wait Until Page Contains Element   ${own_sharedassetsfolder_lctr}  timeout=30s
    Double Click Element   ${own_sharedassetsfolder_lctr}
Go to published folder
    Sleep  3s
    [Arguments]  ${markettestinput}

    #Scroll Element Into View  ${layoutfolder}
    ${own_publishedfolder_lctr}  Set Variable  xpath://div[text()='${markettestinput[7]}']
    Wait Until Page Contains Element   ${own_publishedfolder_lctr}  timeout=30s
    Double Click Element   ${own_publishedfolder_lctr}

Go to sharedwipasset
    Sleep  3s
    [Arguments]  ${markettestinput}

    ${own_sharedwip_asset_lctr}  Set Variable  xpath://div[text()='${markettestinput[8]}']
    #Scroll Element Into View  ${assetfolder}
    Wait Until Page Contains Element   ${own_sharedwip_asset_lctr}  timeout=30s
    Double Click Element   ${own_sharedwip_asset_lctr}
Check sharedwipasset thumbnail
    Sleep  3s
    [Arguments]  ${markettestinput}

    ${assetname}  Convert To String  ${markettestinput[8]}
    ${assetnamewithoutspaces}  replacespaces  ${assetname}
    ${own_sharedwip_assetthumbnail_lctr}  Set Variable  xpath://img[contains(@src,'${assetnamewithoutspaces}')]
    Wait Until Page Contains Element   ${own_sharedwip_assetthumbnail_lctr}  timeout=30s
    ${sharedwipassettrunkimagesize}  Get Element Size   ${own_sharedwip_assetthumbnail_lctr}
    log   ${sharedwipassettrunkimagesize}

Check downloadoriginalrenditionlink is present on sharedwip trunk
    Sleep  3s
    [Arguments]  ${markettestinput}
    ${assetname}  Convert To String  ${markettestinput[8]}
    ${assetnamewithoutspaces}  replacespaces  ${assetname}
    ${own_sharedwip_downloadtrunk_lctr}  Set Variable  xpath://a[@title='Download' and contains(@href,'${assetnamewithoutspaces}')]
    Wait Until Page Contains Element   ${own_sharedwip_downloadtrunk_lctr}  timeout=30s
    Page Should Contain Link  ${own_sharedwip_downloadtrunk_lctr}
    Capture Element Screenshot  ${own_sharedwip_downloadtrunk_lctr}

Check productiondigitallink is present on sharedwip trunk
    Sleep  3s
    Wait Until Page Contains Element   ${own_sharedwip_productiondigitallink_lctr}  timeout=30s
    Page Should Contain Link  ${own_sharedwip_productiondigitallink_lctr}
    Capture Element Screenshot  ${own_sharedwip_productiondigitallink_lctr}

#diffmarketonly
Check downloadoriginalrenditionlink is not present on sharedwip trunk
    Sleep  3s
    [Arguments]  ${markettestinput}

    ${assetname}  Convert To String  ${markettestinput[8]}
    ${assetnamewithoutspaces}  replacespaces  ${assetname}
    ${own_sharedwip_downloadtrunk_lctr}  Set Variable  xpath://a[@title='Download' and contains(@href,'${assetnamewithoutspaces}')]
    #Wait Until Page Contains Element   ${own_sharedwip_downloadtrunk_lctr}  timeout=30s
    Page Should not Contain Link  ${own_sharedwip_downloadtrunk_lctr}
    #Capture Element Screenshot  ${own_sharedwip_downloadtrunk_lctr}

