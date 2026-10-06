@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Consumption query Entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'Id' ]
define root view entity ZHEADER_c_GG
  provider contract transactional_query
  as projection on zheader_r_gg
{
  key SalesUUID,
      @Search.defaultSearchElement: true
      Id,
      Email,
      FirstName,
      LastName,
      Country,
      Creaton,
      DeliveryDate,
      OrderStatus,
      ImageUrl,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _items : redirected to composition child ZITEMS_C_GG
}
