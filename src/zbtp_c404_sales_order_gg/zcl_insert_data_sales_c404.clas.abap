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

    DATA: lt_header TYPE TABLE OF zheader_gg_a,
          lt_items  TYPE TABLE OF zitems_gg_a.
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
    DELETE FROM zheader_gg_a.
    INSERT zheader_gg_a FROM TABLE @lt_header.

    IF sy-subrc EQ 0.
      out->write( |Tabla header: { sy-dbcnt } registros insertados| ).
    ENDIF.

    DATA: lv_uuid_x16_1_1 TYPE sysuuid_x16,
          lv_uuid_x16_1_2 TYPE sysuuid_x16,
          lv_uuid_x16_2_1 TYPE sysuuid_x16,
          lv_uuid_x16_2_2 TYPE sysuuid_x16.

    lv_uuid_x16_1_1 = cl_system_uuid=>create_uuid_x16_static( ).
    lv_uuid_x16_1_2 = cl_system_uuid=>create_uuid_x16_static( ).

    lv_uuid_x16_2_1 = cl_system_uuid=>create_uuid_x16_static( ).
    lv_uuid_x16_2_2 = cl_system_uuid=>create_uuid_x16_static( ).

    "fill internal table items
    lt_items = VALUE #(
    ( items_uuid =  lv_uuid_x16_1_1 parent_uuid = lv_uuid_x16_1 id = '001' items_id = '010' name = 'Articulo1' description = 'Descripcion_001'
     release_date = '20260831' discontinued_date = '20261231' price = '1500.00' currency_code = 'COP' height = '10'
     width = '20' depth = '30' quantity = '40' unit_of_measure = 'CM' )
    ( items_uuid =  lv_uuid_x16_1_2 parent_uuid = lv_uuid_x16_1 id = '001' items_id = '020' name = 'Articulo2' description = 'Descripcion_002'
    release_date = '20260831' discontinued_date = '20261231' price = '1600.00' currency_code = 'COP' height = '11'
     width = '21' depth = '31' quantity = '41' unit_of_measure = 'CM' )
    ( items_uuid =  lv_uuid_x16_2_1 parent_uuid = lv_uuid_x16_2 id = '002' items_id = '010' name = 'Articulo3' description = 'Descripcion_003'
    release_date = '20260831' discontinued_date = '20261231' price = '1700.00' currency_code = 'USD' height = '20'
     width = '30' depth = '40' quantity = '25' unit_of_measure = 'CM' ) ).

    "Delete possible entries; insert new entries
    DELETE FROM zitems_gg_a.
    INSERT zitems_gg_a FROM TABLE @lt_items.

    IF sy-subrc EQ 0.
      out->write( |Tabla items: { sy-dbcnt } registros insertados| ).
    ENDIF.

    "Check result in console
    out->write( 'DONE!' ).


  ENDMETHOD.
ENDCLASS.
