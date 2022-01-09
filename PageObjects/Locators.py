#Login Page Elements

txt_loginUserName_lctr="id:idp-discovery-username"
next_button_lctr="id:idp-discovery-submit "
txt_loginps_lctr="class:password-with-toggle"
txt_verify_lctr="css:input[class='button button-primary']"
submitbutton_lctr = "id:idp-discovery-submit"

#Welcome Page Locators

welcomemessage_lctr= "xpath://div[@id='welcome-message']"
Imagestabicon_lctr = "xpath://div[@class='icon damadmin']"
Imagestouchuitabicon_lctr = "class:icon damadmin-touch-ui"
Publicationstabicon_lctr = "class:icon dampubadmin"
Contentcreatorscontracttabicon_lctr = "xpath://div[@class='icon damcreatoradmin']"
Videostabicon_lctr = "class:icon videodam"
Syndicationafterpublicationtabicon_lctr = "class:icon damreservationadmin"
Syndicationbeforepublicationtabicon_lctr = "xpath://div[@class='icon damreservationadminwip']"
Inboxtabicon_lctr = "class:icon inbox"
tabcontent_lctr = "class:title"

#Basic Search

searchtab_lctr = "xpath://span[text()='Search']"
basicsearch_inputtextfield_lctr = "xpath://input[@name='0_group.10_group.tagsearch']"
basicsearch_searchbutton_lctr = "xpath://button[text()='Search']"
basicsearch_pleaseaddfilterokbutton_lctr = "xpath://button[text()='OK']"
basicsearchClearbutton_lctr = "xpath:(//button[text()='Clear'])[2]"
basicsearch_autosuggestion_lctr = "xpath://div[@class='x-combo-list-item']"
basicsearchresult_lctr = "xpath:(//div[@class='x-grid3-scroller'])[3]"
firstsearchrsltrow_lctr = "xpath:(//td/div[@class='x-grid3-cell-inner x-grid3-col-numberer' and text()='1'])[2]"
firstsearchresult_lctr  = "xpath:(//div[@class='x-grid3-cell-inner x-grid3-col-thumbnail'])[1]"
ADPHeight_lctr = "xpath://label[text()='Height']"
numberofresultlocator = "xpath:(//tr[@class='x-toolbar-right-row']/td/div[@class='xtb-text'])[4]"

#Advanced Search

searchtab_lctr = "xpath://span[text()='Search']"
advanced_searchtab_lctr ="xpath://span[text()='Advanced']"
advanced_inputtextfield_lctr = "xpath://input[@name='3_group.tagsearch']"
advanced_foldertypecheckbox_lctr = "xpath://input[@name='5_group.publishertype.commissioned']"
advanced_searchbutton_lctr = "xpath://button[text()='Search']"
advanced_blankspace_lctr = "xpath://div[@class='x-grid3-scroller']"
advanced_ragstatuscheckbox_lctr = "xpath://input[@value='amber']"
advanced_ragstatusxpath_lctr  = "xpath://div[@class='x-grid3-cell-inner x-grid3-col-batchId']/div/div[@class='status status-permissionRequired']"
advanced_ragstatus_adp = "xpath://div[@id='ragStat_0']"
advanced_commissionedicon ="xpath://div[@class='status status-publisherCommissioned']"

#Extended Search
searchtab_lctr = "xpath://span[text()='Search']"
extended_searchtab_lctr =  "xpath://span[text()='Extended']"
extended_contractedcreatorcontractcheckbox_lctr = "xpath://input[@name='cniContractField']"
extended_clearselection_lctr = "xpath://button[text()='Clear Selections']"
extended_nextbuttoner_lctr = "xpath://button[text()='Next']"
extended_addcontract_lctr =  "xpath://button[text()='Add Contract']"
extended_contractcreatorname_lctr ="xpath://div[contains(text(),'ABRAHAMS')]"
extended_contractname_lctr = "xpath://div[contains(text(),'International Mark Abrahams')]"
extended_okbutton_lctr = "xpath://button[text()='Ok']"
extended_finishbutton_lctr = "xpath://button[text()='Finish']"
extended_extendassetresult_lctr = "xpath:(//div[@class='x-grid3-scroller'])[3]/div/div/table/tbody/tr[1]"

#Contentcreatorpage
contentcreator_actionsdropdown_lctr =  "xpath://button[contains(text(),'Actions')]"
contentcreator_createbutton_lctr = "xpath://span[contains(text(),'Create')]"
contentcreator_firstname_lctr = "id:cni-dam-givenName"
contentcreator_lastname_lctr = "id:cni-dam-familyName"
contentcreator_creatortypetextfield_lctr ="xpath://input[@class='x-form-text x-form-field invisible-input']"
contentcreator_creatortypesuggestions_lctr ="css:div[class='x-combo-list-item x-combo-selected']"
contentcreator_isactivecheckbox_lctr = "name:./isActive"
contentcreator_savebutton_lctr = "xpath://button[contains(text(),'Save')]"
contentcreator_resetbuttondisabled_lctr = "xpath://table[@id='cq-creator-admin-centerpanel-details-reset' and contains(@class,'disabled')]"
contentcreator_creatorcentrename_lctr ="id:cq-creator-admin-centerpanel-details-toolbar-creatorname"
contentcreator_addcontractbutton_lctr = "xpath://button[text() = 'Add Contract']"
contentcreator_contractnameaftercreated_lctr = "xpath://table[@id='cq-creator-admin-centerpanel-details-toolbar-creatorname']"
contentcreator_contractdescription_lctr = "xpath://input[@name='./cni:name']"
contentcreator_textfield_contractmarket_lctr = "xpath://div[@class='x-form-element']//div[@class=' x-panel x-panel-noborder']//input[@name=':ignore']"
contentcreator_marketsuggestion_lctr = "xpath://b[text()='United']"
contentcreator_calender_lctr = "xpath://div[@class='x-form-element']/div/table/tbody/tr/td/div/input[@type='text']//following-sibling::img[@src='/libs/cq/ui/resources/0.gif']"
contentcreator_date_lctr = "xpath://span[text()='24']"
contentcreator_commissionedradiobutton_lctr = "xpath://input[@Type='radio' and @value='commissioned']"
contentcreator_noncommissionedradiobutton_lctr = "xpath://input[@Type='radio' and @value='noncommissioned']"
contentcreator_studioradiobutton_lctr = "xpath://input[@Type='radio' and @value='studio']"
contentcreator_savecontractbutton_lctr = "xpath:(//button[text()='Save'])[2]"
contentcreator_detailstab_lctr = "xpath://span[text()='Details']"
contentcreator_contractspace_lctr = "xpath:(//div[@class='x-grid3-scroller'])[2]"


#Featurefolder
fixedfolder_lctr = "xpath://div[@id='cq-damadmin-myfolders-tree']/div[@class='x-panel-bwrap']/div[@class='x-panel-body x-panel-body-noheader x-panel-body-noborder']/ul[@class='x-tree-root-ct x-tree-lines']/div[@class='x-tree-root-node']/li[@class='x-tree-node']/div[contains(@class,'fixedFolder')]"
createfeaturefolderoption_lctr = "xpath:(//span[@class='x-menu-item-text' and contains(text(),'New Feature Folder...')])[last()]/parent::a"
featurefoldernamefield_lctr = "xpath://input[@name='./name']"
finishbutton_lctr = "xpath://button[contains(text(),'Finish')]"
myfoldertab_lctr = "xpath://span[contains(@class,'x-tab-strip-text ') and contains(text(),'My Folders')]"
featurefolderlist_lctr  = "xpath://div[@class='x-grid3-cell-inner x-grid3-col-2']"
numberoffolders_lctr = "xpath:(//tr[@class='x-toolbar-right-row']/td/div[@class='xtb-text'])[1]"
foldertab_lctr = "xpath://span[contains(@class,'x-tab-strip-text ') and text() ='Folders']"
#uploadfolder
commissionedfoldertype_lctr = "xpath://div[@id='cq-damadmin-myfolders-tree']/div[@class='x-panel-bwrap']/div[@class='x-panel-body x-panel-body-noheader x-panel-body-noborder']/ul[@class='x-tree-root-ct x-tree-lines']/div[@class='x-tree-root-node']/li[@class='x-tree-node']/div[contains(@class,'commissionedFolder')]"
createuploadfolderoption_lctr = "xpath:(//span[text()='New Upload Folder...'])[last()]/parent::a"
blankspaceupload_lctr = "xpath://div[@class='x-grid3-scroller']"
uploadfoldernamefield_lctr = "id:upload-folder-name"
nextbutton_upload_lctr = "xpath://button[contains(text(),'Next')]"
finishbutton_upload_lctr = "xpath://button[contains(text(),'Finish')]"
uploadfolderlist_lctr = "xpath:(//div[@class='x-grid3-scroller'])[1]"
loadover_lctr = "xpath://div[@class='x-grid3-cell-inner x-grid3-col-2' and text()='testfeature']"

#Lightbox
lightboxexpandarrow_lctr = "id:cq-damadmin-lightbox-wrapper-xcollapsed"
lightboxtool_lctr = "xpath://div[@class='x-tool x-tool-search']"
createnewlightboxoption_lctr = "xpath://button[text()='Create New Syndication Lightbox']"
lightboxnamefield_lctr = "xpath://input[@name='title']"
lightboxlocicon_lctr = "xpath://input[@name='location']"
UKmarketfolder_lctr = "xpath:(//span[text()='UK'])[last()]"
Glamourtitlefolder_lctr = "xpath:(//span[text()='Glamour'])[last()]"
wipfolder_lctr = "xpath:(//span[text()='wip'])[last()]"
OKbutton_lctr = "xpath://button[text()='OK']"
Createbutton_lctr = "xpath://button[text()='Create']"
switchsyndicationlightboxoption_lctr = "xpath://button[text()='Switch Syndication Lightbox']"
ltboxlociconvalidation_lctr = "xpath:(//img[@class='x-form-trigger x-form-search-trigger'])[1]"
wipcontent_lctr =  "//body/div/div[@class=' x-window-plain x-form-label-left']/div[@class='x-window-plain-bwrap']/form[@class='x-window-plain-body x-window-plain-body-noheader x-form']/div[@class=' x-window cq-browsedialog x-window-plain x-resizable-pinned']/div[@class='x-window-bwrap']/div[@class='x-window-ml']/div[@class='x-window-mr']/div[@class='x-window-mc']/div[@class='x-window-body']/div[@class=' x-panel x-tree']/div[@class='x-panel-bwrap']/div[@class='x-panel-body x-panel-body-noheader x-panel-body-noborder']/ul[@class='x-tree-root-ct x-tree-no-lines']/li[@class='x-tree-node']/ul[@class='x-tree-node-ct']/li[@class='x-tree-node']/ul[@class='x-tree-node-ct']/li[@class='x-tree-node']/ul[@class='x-tree-node-ct']/li[2]/ul[1]"
#Fashionshow
Fashionshowsearch_lctr = "xpath:(//span[text()='Fashion Shows'])[2]"
Fashionshowtext_lctr = "xpath://input[@name='14_group.114_group.tagsearch']"
Fashionshowsearchbutton_lctr = "xpath://button[text()='Search']"
Divsearchresult_lctr = "xpath:(//div[@class='x-grid3-scroller'])[3]"
ADPshow_lctr = "xpath://label[text()='Show']"

#Publicationssearch
Publicationstab_lctr="xpath://div[text()='Publications']"
Publicationssearchtab_lctr="xpath://span[text()='Search']"
Publicationssearchtextfield_lctr="xpath://input[@name='0_group.tagsearch']"
Publicationsresultdiv_lctr="xpath://div[@id='cq-siteadminsearchpanel-dataviewpanel-dataview']"
Publicationssearchbutton_lctr = "xpath://button[text()='Search']"
Publications_noresult_lctr = "xpath://div[text()='No Results Found']"
firstpublicationsearchresult_lctr = "xpath://div[@class='data-view-item layout-page-thumbnail-medium thumbnail-medium']"
publicationnumberofresultlocator = "xpath:(//tr[@class='x-toolbar-right-row']/td/div[@class='xtb-text'])[3]"
#TouchUI
Touchuitab_lctr="xpath://div[text()='Images - Touch UI']"
TouchuiSearchicon_lctr="xpath://coral-icon[@icon='search']"
Touchuisearchtextfield_lctr="//input[@placeholder='Type to search ...']"
Productnavigationclosebutton_lctr = "xpath://coral-button-label[text()='Close']"
Blankspacetouchui_lctr = "xpath://coral-masonry[@id='granite-omnisearch-result']"
leftbar_lctr = "xpath://coral-cyclebutton[@id='granite-omnisearch-result-rail-toggle']/button/coral-icon[@class='coral3-Icon coral3-Icon--sizeS coral3-Icon--railLeft']"
Filetype_lctr = "xpath://coral-accordion-item-label[normalize-space()='File Type']"
touchuiimagescheckbox_lctr = "xpath://input[@value='Images']"
touchuirightstatusfilter_lctr = "xpath://body/coral-overlay[@class='granite-omnisearch-overlay coral3-Overlay is-open']/form[@class='foundation-form granite-omnisearch-form']/div[@class='foundation-layout-panel']/div[@class='foundation-layout-panel-bodywrapper']/div[@class='granite-omnisearch-content foundation-layout-panel-body coral--light']/div[@class='foundation-layout-panel']/div[@class='foundation-layout-panel-bodywrapper']/div[@class='foundation-layout-panel-body']/div[@class='foundation-toggleable foundation-layout-panel-rail granite-rail foundation-layout-panel-rail-active']/coral-panelstack[@role='presentation']/coral-panel[@role='tabpanel']/coral-panel-content/div[@class='search-scrollable']/coral-accordion[3]/coral-accordion-item[1]/div[1]/coral-icon[1]"
Reqapprovalcheckbox_lctr = "xpath://input[@name='21_group.property.2_value_visible']"
touchuiomnisearchresult_lctr = "xpath://coral-masonry[@id='granite-omnisearch-result']"
touchuiomnisearchsuggestions_lctr = "xpath://coral-buttonlist[contains(@class,'granite-omnisearch-typeahead-suggestions')]"
touchuinumberofresults_lctr  =  "xpath://granite-pagingstatus[@class='granite-collection-pagingstatus']"
touchuinoresultsfound_lctr =  "xpath://granite-pagingstatus[text()='0 of 0']"
touchuifirstsearchresult_lctr   = "xpath:(//coral-card-asset)[1]"
touchuiinfoicon_lctr = "xpath:(//coral-quickactions[contains(@id,'coral-id-')]//button[@title='Properties']//coral-icon[@aria-label='info circle'])[1]"
touchuimetadata_lctr = "xpath://h3[text()='Metadata']"
assetinfoformid_lctr = "xpath://form[@id='aem-assets-metadataeditor-formid']"
assetformidfieldsvalues_lctr = "xpath://label[@class='coral-Form-fieldlabel']/following-sibling::div[@class='coral-Form-fieldwrapper']/input[@class='coral-Form-field coral3-Textfield']"

#Publicfoldernavigation
own_publicfolder_lctr = "xpath://div[@id='cq-damadmin-myfolders-tree']/div[@class='x-panel-bwrap']/div[@class='x-panel-body x-panel-body-noheader x-panel-body-noborder']/ul[@class='x-tree-root-ct x-tree-lines']/div[@class='x-tree-root-node']/li[@class='x-tree-node']/div[contains(@class,'publicFolder')]"
own_yearfolder_lctr = "xpath://div[@class='x-grid3-cell-inner x-grid3-col-2' and contains(text(),'2021')]"
own_editionfolder_lctr = "xpath://div[contains(text(),'2020 Wired World 2021')]"
own_printfolder_lctr = "xpath://div[contains(text(),'Print')]"
own_sectionfolder_lctr = "xpath://div[contains(text(),'Editorial')]"
own_layoutfolder_lctr = "xpath://div[contains(text(),'11-20-WiredWorld-Business')]"
own_assetfolder_lctr = "xpath://div[contains(text(),'Assets')]"
own_unknownfolder_lctr = "xpath://div[contains(text(),'unknown')]"
own_ingestedfolder_lctr = "xpath://div[contains(text(),'ingested')]"
own_asset_lctr = "xpath://div[contains(text(),'1120WiredWorldBusiness01')]"
own_assetthumbnail_lctr = "xpath://img[@src='/content/dam/cni-dam/uk/wired/public/2021/2020%20Wired%20World%202021/Print/Editorial/11-20-WiredWorld-Business/Assets/unknown/ingested/1120WiredWorldBusiness01.psd.thumb.319.319.1604007013000.jpg']"
own_finishfeaturebutton_lctr = "xpath://button[text()='Finish']"
own_branchexpandbutton_lctr = "xpath://div[@class='x-layout-collapsed x-layout-collapsed-east x-layout-cmini-east']"
own_branchthumbnail_lctr = "xpath://img[contains(@src,'https://emea-staging.cnidam.com/content/dam/cni-dam/uk/wired/public/2021/2020%20Wired%20World%202021/')]"
own_productiondigitallink_lctr = "xpath://a[@title='Download production digital']"
own_downloadproduction_branch_lctr = "xpath://a[text()='Download production']"
own_downloadtrunk_lctr = "xpath://a[@title='Download']"

