@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clients Books'
@Metadata.ignorePropagatedAnnotations: true
define view entity zc_clints_libs_log_c404_gmgp
  as select from ztb_clnts_lib_gm
{
 key id_libro                 as BookID,
 count( distinct id_cliente ) as Sales

  }
  group by id_libro;
