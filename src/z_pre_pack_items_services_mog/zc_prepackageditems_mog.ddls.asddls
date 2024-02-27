@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption Pre Package Items - BR MOG'
@Metadata.allowExtensions: true
@ObjectModel: { 
    representativeKey: 'PackageUuid',
    semanticKey: [ 'PackageUuid' ],
    usageType: {
        serviceQuality: #X,
        sizeCategory: #S,
        dataClass: #TRANSACTIONAL 
    }
}
define root view entity ZC_PrePackagedItems_MOG as projection on ZI_PrePackagedItems_MOG
{
    key PackageUuid,
    PackageId,
    Plant,
    PurchaseRequisitionItemText,
    AccountAssignmentCategory,
    RequestedQuantity,
    BaseUnit,
    PurchaseRequisitionPrice,
    PurReqnItemCurrency,
    MaterialGroup,
    PurchasingGroup,
    PurchasingOrganization, 
    CreationDate, 
    CreationTime, 
    CreationUser
}
