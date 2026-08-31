CLASS zcl_insert_data_sales_c404 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_insert_data_sales_c404 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*Draft fields
*local_created_by      : abp_creation_user;
*local_created_at      : abp_creation_tstmpl;
*local_last_changed_by : abp_locinst_lastchange_user;
*local_last_changed_at : abp_locinst_lastchange_tstmpl;
*last_changed_at       : abp_lastchange_tstmpl;

    DATA: lt_header TYPE TABLE OF zheader_gg.
*          lt_items    TYPE TABLE OF zitems_gg.
    DATA: lv_uuid_x16_1 TYPE sysuuid_x16,
          lv_uuid_x16_2 TYPE sysuuid_x16,
          lv_uuid_x16_3 TYPE sysuuid_x16.

    " Generar un UUID en formato RAW(16)
    lv_uuid_x16_1 = cl_system_uuid=>create_uuid_x16_static( ).
    lv_uuid_x16_2 = cl_system_uuid=>create_uuid_x16_static( ).
    lv_uuid_x16_3 = cl_system_uuid=>create_uuid_x16_static( ).
******** TABLA1 ********
    "fill internal table
    lt_header = VALUE #(
    ( sales_uuid =  lv_uuid_x16_1 id = '001' email = 'email@net.com'  first_name = 'Nombre001' last_name = 'Apellido_001' country = 'COL' delivery_date = '20260831' order_status = '1' image_url = ''   )
    ( sales_uuid =  lv_uuid_x16_2 id = '002' email = 'email@net.com'  first_name = 'Nombre001' last_name = 'Apellido_001' country = 'COL' delivery_date = '20260831' order_status = '2' image_url = ''   )
    ( sales_uuid =  lv_uuid_x16_3 id = '003' email = 'email@net.com'  first_name = 'Nombre001' last_name = 'Apellido_001' country = 'COL' delivery_date = '20260831' order_status = '3' image_url = ''   ) ).


    "Delete possible entries; insert new entries
    DELETE FROM zheader_gg.
    INSERT zheader_gg FROM TABLE @lt_header.

    IF sy-subrc EQ 0.
      out->write( |Acceso Categorias: { sy-dbcnt } registros insertados| ).
    ENDIF.

    "Check result in console
    out->write( 'DONE!' ).


  ENDMETHOD.
ENDCLASS.
