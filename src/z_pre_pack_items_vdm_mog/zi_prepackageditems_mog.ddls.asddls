@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VDM Pre Package Items - BR MOG'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel: { 
    representativeKey: 'PackageUuid',
    semanticKey: [ 'PackageUuid' ],
    usageType: {
        serviceQuality: #X,
        sizeCategory: #S,
        dataClass: #TRANSACTIONAL 
    }
}
define root view entity ZI_PrePackagedItems_MOG as select from zprepackitem_mog
{
    @Semantics.uuid: true
    key package_uuid    as PackageUuid                ,
    package_id          as PackageId                  ,
    plant               as Plant                      ,
    purch_req_it_text   as PurchaseRequisitionItemText,
    acc_assignment_cat  as AccountAssignmentCategory  ,
    @Semantics.quantity.unitOfMeasure: 'BaseUnit'
    requested_qty       as RequestedQuantity          ,
    base_unit           as BaseUnit                   ,
    @Semantics.amount.currencyCode: 'PurReqnItemCurrency'
    purch_req_price     as PurchaseRequisitionPrice   ,
    pur_req_item_curr   as PurReqnItemCurrency        ,
    material_group      as MaterialGroup              ,
    purch_group         as PurchasingGroup            ,
    purch_org           as PurchasingOrganization     ,
    @Semantics.businessDate.at: true 
    create_date         as CreationDate               ,
    create_time         as CreationTime               ,
    @Semantics.user.createdBy: true
    create_user         as CreationUser               
}
