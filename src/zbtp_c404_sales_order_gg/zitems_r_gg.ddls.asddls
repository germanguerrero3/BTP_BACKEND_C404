@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items Root Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity zitems_r_gg
  as select from zitems_gg_a
  association        to parent zheader_r_gg as _Header   on $projection.SalesUUID = _Header.SalesUUID
  association [0..1] to I_Currency          as _Currency on $projection.CurrencyCode = _Currency.Currency
{
  key items_uuid            as ItemsUUID,
      parent_uuid           as SalesUUID,

      id                    as Id,
      items_id              as ItemsId,
      name                  as Name,
      description           as Description,
      release_date          as ReleaseDate,
      discontinued_date     as DiscontinuedDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      height                as Height,
      unit_of_measure       as UnitOfMeasure,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      width                 as Width,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      depth                 as Depth,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      quantity              as Quantity,

      // Local ETAg field
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      _Header,
      
      _Currency
}
