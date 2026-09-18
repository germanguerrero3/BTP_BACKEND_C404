@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZHEADER_i_GG
  provider contract transactional_interface
  as projection on zheader_r_gg
{
  key SalesUUID,
      Id,
      Email,
      FirstName,
      LastName,
      Country,
      Creaton,
      DeliveryDate,
      OrderStatus,
      ImageUrl,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true      
      LastChangedAt,
      /* Associations */
      _items     : redirected to composition child ZITEMS_i_GG   
}
