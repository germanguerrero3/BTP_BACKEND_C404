@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items  Consumption query Entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'ItemsId' ]
define view entity ZITEMS_C_GG
  as projection on zitems_r_gg
{
  key ItemsUUID,
      SalesUUID,
      @Search.defaultSearchElement: true      
      Id,
      @Search.defaultSearchElement: true      
      ItemsId,
      Name,
      Description,
      ReleaseDate,
      DiscontinuedDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      Height,
      UnitOfMeasure,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      Width,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      Depth,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      Quantity,

      LocalLastChangedAt,
      /* Associations */
      _Currency,
      _Header : redirected to parent ZHEADER_c_GG
}
