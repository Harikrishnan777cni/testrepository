*** Settings ***
Library  SeleniumLibrary
Variables  ../../PageObjects/Locators.py


*** Keywords ***


Go to contract creator option
    Wait Until Page Contains Element   ${Contentcreatorscontracttabicon_lctr}  timeout=30s
    Click element  ${Contentcreatorscontracttabicon_lctr}
Select action drop down option
     Wait Until Page Contains Element  ${contentcreator_actionsdropdown_lctr}  timeout=30s
     Click element  ${contentcreator_actionsdropdown_lctr}
Select create option
    Wait Until Page Contains Element  ${contentcreator_createbutton_lctr}  timeout=30s
    Click element   ${contentcreator_createbutton_lctr}

Enter first name
    ${firstname_input}  Generate Random String  8  [LETTERS]
    [return]  ${firstname_input}
    Wait Until Page Contains Element   ${contentcreator_firstname_lctr}  timeout=30s
    Input text  ${contentcreator_firstname_lctr}    ${firstname_input}

Enter last name
    ${lastname_input}  Generate Random String  8  [LETTERS]
    [return]  ${lastname_input}
    Wait Until Page Contains Element   ${contentcreator_lastname_lctr}  timeout=30s
    Input text  ${contentcreator_lastname_lctr}    ${lastname_input}

Enter creatortype field
    [Arguments]  ${creatortype}
    Wait Until Page Contains Element   ${contentcreator_creatortypetextfield_lctr}  timeout=30s
    Input text  ${contentcreator_creatortypetextfield_lctr}  ${creatortype}

Select creator type
    [Arguments]  ${creatortype}
    Wait Until Page Contains Element   xpath://b[text()='${creatortype}']  timeout=30s
    Click element  xpath://b[text()='${creatortype}']

Mark isactivecheckbox
    Wait Until Page Contains Element   ${contentcreator_isactivecheckbox_lctr}  timeout=30s
    Select checkbox  ${contentcreator_isactivecheckbox_lctr}
Click save

    Wait Until Page Contains Element   ${contentcreator_savebutton_lctr}  timeout=30s
    Click button  ${contentcreator_savebutton_lctr}
    Wait Until Page Doesnot Contain Element  ${contentcreator_resetbuttondisabled_lctr}  timeout=30s

Select add contract button
    Wait Until Page Contains Element   ${contentcreator_addcontractbutton_lctr}  timeout=30s
    Click button  ${contentcreator_addcontractbutton_lctr}
Input contract description
    [Arguments]   ${contractdescriptioninput}
    Wait Until Page Contains Element   ${contentcreator_contractdescription_lctr}  timeout=30s
    Input text  ${contentcreator_contractdescription_lctr}  ${contractdescriptioninput}
Input market textfield
    [Arguments]   ${markettextfield}
    Wait Until Page Contains Element   ${contentcreator_textfield_contractmarket_lctr}  timeout=30s
    Input text  ${contentcreator_textfield_contractmarket_lctr}  ${markettextfield}
Select market suggestion
    [Arguments]  ${markettextfield}
    Wait Until Page Contains Element   xpath://b[text()='${markettextfield}']  timeout=30s
    Click element  xpath://b[text()='${markettextfield}']
Open calender
    Wait Until Page Contains Element  ${contentcreator_calender_lctr}  timeout=30s
    Click element  ${contentcreator_calender_lctr}
Select date
    Wait Until Page Contains Element   ${contentcreator_date_lctr}  timeout=30s
    Click element  ${contentcreator_date_lctr}
Select commissionedradiobutton
    Wait Until Page Contains Element   ${contentcreator_commissionedradiobutton_lctr}  timeout=30s
    Click element  ${contentcreator_commissionedradiobutton_lctr}
Click save button
    Wait Until Page Contains Element   ${contentcreator_savecontractbutton_lctr}  timeout=30s
    Click button  ${contentcreator_savecontractbutton_lctr}
Go back to details tab
    Wait Until Page Contains Element   ${contentcreator_detailstab_lctr}  timeout=30s
    Click element  ${contentcreator_detailstab_lctr}
Check contract space
    [Arguments]   ${contractdescriptioninput}
    Wait Until Page Contains Element   ${contentcreator_contractspace_lctr}  timeout=30s
    Sleep  2s
    Element Should Contain  ${contentcreator_contractspace_lctr}  ${contractdescriptioninput}








