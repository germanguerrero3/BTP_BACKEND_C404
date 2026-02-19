@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Books'
@Metadata.ignorePropagatedAnnotations: true
define view entity zc_books_log_c404_gmgp
  as select from    ztb_libros_gmgp         as Books
    inner join      ztb_catego_gmgp         as Categ on Books.bi_categ = Categ.bi_categ
    left outer join ZC_CLINTS_LIBS_LOG_C404 as Sales on Books.id_libro = Sales.BookID
  association [0..*] to zc_clients_log_gmgp_c404 as _Clients on $projection.BookID = _Clients.BookID
{
  key Books.id_libro    as BookID,
      Books.titulo      as Tittle,
      Books.bi_categ    as Category,

      Books.autor       as Author,
      Books.editorial   as Editorial,
      Books.idioma      as Language,
      Books.paginas     as PagesNumber,
      @Semantics.amount.currencyCode: 'Currency'
      Books.precio      as Price,
      Books.moneda      as Currency,

      case
       when Sales.Sales < 1 then 0
       when Sales.Sales = 1 then 1
       when Sales.Sales = 2 then 2
       when Sales.Sales > 2 then 3
       else 0
       end              as Sales,
      Categ.descripcion as Description,

      Books.formato     as BookFormat,
      Books.url         as Images,

      _Clients
}
