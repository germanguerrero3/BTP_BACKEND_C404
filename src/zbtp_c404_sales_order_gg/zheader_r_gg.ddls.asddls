@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Root Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zheader_r_gg
  as select from zheader_gg_a
  composition [0..*] of zitems_r_gg  as _items 

{
  key sales_uuid            as SalesUUID,
      id                    as Id,
      email                 as Email,
      first_name            as FirstName,
      last_name             as LastName,
      country               as Country,
      creaton               as Creaton,
      delivery_date         as DeliveryDate,
      order_status          as OrderStatus,
      image_url             as ImageUrl,

      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,

      // Local ETAg field --> OData Etag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      // Total ETag Field
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      //    _association_name // Make association public
      _items 
}
