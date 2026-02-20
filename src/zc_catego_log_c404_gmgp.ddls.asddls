@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Categories'
@Metadata.ignorePropagatedAnnotations: true
define view entity zc_catego_log_C404_gmgp
  as select from ztb_catego_gmgp as category
{
  key bi_categ    as Category,
      descripcion as Description
}
