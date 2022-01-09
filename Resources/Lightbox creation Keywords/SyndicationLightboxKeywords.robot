*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locators.py
Library  String


*** Keywords ***
Go to images page
    Wait Until Page Contains Element  ${Imagestabicon_lctr}  timeout=30s
    Click element  ${Imagestabicon_lctr}

clickltboxexpandarrow
    Wait Until Page Contains Element  ${lightboxexpandarrow_lctr}  timeout=30s
    Click element  ${lightboxexpandarrow_lctr}

clickltboxsearchtool
    Sleep  5s
    Wait Until Element is Visible  ${lightboxtool_lctr}  timeout=30s
    Double Click element    ${lightboxtool_lctr}

createnewltboxoption
    Wait Until Page Contains Element  ${createnewlightboxoption_lctr}  timeout=30s
    Click element    ${createnewlightboxoption_lctr}
enterltboxname
    ${lightbox_nameinput}  Generate Random String  8  [LETTERS]
    Wait Until Page Contains Element  ${lightboxnamefield_lctr}  timeout=30s
    Sleep  5s
    Input text   ${lightboxnamefield_lctr}  ${lightbox_nameinput}
    Sleep  5s
    [Return]  ${lightbox_nameinput}
selctltboxlocation
    Wait Until Page Contains Element  ${lightboxlocicon_lctr}  timeout=30s
    Click element   ${lightboxlocicon_lctr}
selctmarketfolder
    [Arguments]  ${market}
    Wait Until Element is Visible  xpath:(//span[text()='${market}'])[last()]  timeout=30s
    Click element   xpath:(//span[text()='${market}'])[last()]
selecttitlefolder
    [Arguments]  ${title}
    Sleep  2s
    Wait Until Element is Visible  xpath:(//span[text()='${title}'])[last()]  timeout=30s
    Click element   xpath:(//span[text()='${title}'])[last()]
selectwipfolder
    Wait Until Page Contains Element   ${wipfolder_lctr}  timeout=50s
    Sleep  2s
    Scroll Element Into View    ${wipfolder_lctr}
    Double click element  ${wipfolder_lctr}
selectokbutton
    Wait Until Page Contains Element   ${OKbutton_lctr}  timeout=30s
    Click button  ${OKbutton_lctr}
clickcreatebutton
    Wait Until Page Contains Element   ${Createbutton_lctr}  timeout=30s
    #Click button  ${Createbutton}
    Mouse Down  ${Createbutton_lctr}
    Mouse Up  ${Createbutton_lctr}
selectswitchlt
    Wait Until Page Contains Element   ${switchsyndicationlightboxoption_lctr}  timeout=30s
    Double click element  ${switchsyndicationlightboxoption_lctr}

selctltboxlocator
    Wait Until Page Contains Element  ${ltboxlociconvalidation_lctr}  timeout=30s
    Click element   ${ltboxlociconvalidation_lctr}
Lightboxverify
    [Arguments]  ${lightbox_nameinput}
    Sleep  5s
    Scroll Element Into View  //span[text()='${lightbox_nameinput}']
    Capture Element Screenshot  //span[text()='${lightbox_nameinput}']
    #Element Should Contain  ${wipcontent_lctr}  ${lightbox_nameinput}