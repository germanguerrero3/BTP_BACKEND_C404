@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clients'
@Metadata.ignorePropagatedAnnotations: true
define view entity zc_clients_log_gmgp_c404
  as select from ztb_clientes_gm as Clients
  inner join ztb_clnts_lib_gm as RelCliLib on RelCliLib.id_cliente = Clients.id_cliente
{
  key RelCliLib.id_libro as BookID,
  key Clients.id_cliente  as ClientID,
  key Clients.tipo_acceso as AccesType,
      Clients.nombre      as Name,
      Clients.apellidos   as LastName,
      Clients.email       as Email,
      Clients.url         as Images
}
