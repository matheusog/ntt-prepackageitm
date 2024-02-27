@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VH for Pre Package Items'

@ObjectModel: {
  dataCategory: #VALUE_HELP, 
  modelingPattern: #VALUE_HELP_PROVIDER, 
  representativeKey: 'PackageId', 
  semanticKey: [ 'PackageId' ],
  supportedCapabilities: [ #CDS_MODELING_DATA_SOURCE, #CDS_MODELING_ASSOCIATION_TARGET, #VALUE_HELP_PROVIDER ],
  usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #TRANSACTIONAL }
}

@Search.searchable: true
@Consumption.ranked: true

/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity ZC_PREPACKAGEDITEMS_VH as select from ZI_PrePackagedItems_MOG
{
    @ObjectModel.text.element: [ 'PurchaseRequisitionItemText' ]
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.9
    @Search.ranking: #HIGH
    @UI.lineItem:       [{ position: 10,label: 'Package ID', importance: #HIGH }]
key PackageId, 
    @UI.lineItem:       [{ position: 20,label: 'Item Text', importance: #HIGH }]
    PurchaseRequisitionItemText,     
    @UI.lineItem:       [{ position: 30,label: 'Plant', importance: #HIGH }]
    Plant, 
    @UI.lineItem:       [{ position: 40,label: 'Purch. Org.', importance: #HIGH }]
    PurchasingOrganization,
    @UI.lineItem:       [{ position: 50,label: 'Purch. Grp.', importance: #HIGH }]
    PurchasingGroup,
    @UI.lineItem:       [{ position: 60,label: 'Material Grp.', importance: #HIGH }]
    MaterialGroup,
    @UI.lineItem:       [{ position: 70,label: 'Acc. Assig. Cat.', importance: #HIGH }]
    AccountAssignmentCategory,
    @UI.lineItem:       [{ position: 80,label: 'Quantity', importance: #HIGH }]
    RequestedQuantity,
    BaseUnit, 
    @UI.lineItem:       [{ position: 90,label: 'Price', importance: #HIGH }]
    PurchaseRequisitionPrice,
    PurReqnItemCurrency,
    @UI.lineItem:       [{ position: 100,label: 'Created On', importance: #HIGH }]
    CreationDate,
    @UI.lineItem:       [{ position: 110,label: 'Created By', importance: #HIGH }]
    CreationUser
}
