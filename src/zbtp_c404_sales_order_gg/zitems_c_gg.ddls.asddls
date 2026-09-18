@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items  Consumption query Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZITEMS_C_GG
  as projection on zitems_r_gg
{
  key ItemsUUID,
      SalesUUID,
      Id,
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
