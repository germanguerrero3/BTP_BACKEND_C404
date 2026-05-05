CLASS zcl_data_gen_rap_c404_gmgp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_gen_rap_c404_gmgp IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    out->write( 'Adding travel data' ).
    DELETE FROM ztravel_c404_g_a.
    INSERT ztravel_c404_g_a FROM (
    SELECT FROM /dmo/travel
    FIELDS
         " client
          uuid( ) AS travel_uuid,
            travel_id,
            agency_id,
            customer_id,
            begin_date,
            end_date,
            booking_fee,
            total_price,
            currency_code,
            description,
            CASE status  WHEN 'B' THEN 'A'
                         WHEN 'P' THEN 'O'
                         WHEN 'N' THEN 'O'
                         ELSE 'X' END AS overall_status,
            createdby AS local_created_by,
            createdat AS local_created_at,
            lastchangedby AS local_last_changed_by,
            lastchangedat AS last_changed_at
          ).
    out->write( 'Adding booking data' ).

    DELETE  FROM zbooking_c40_g_a.

    INSERT zbooking_c40_g_a FROM (
    SELECT FROM /dmo/booking
        JOIN ztravel_c404_g_a ON /dmo/booking~travel_id = ztravel_c404_g_a~travel_id
        JOIN /dmo/travel ON /dmo/travel~travel_id = /dmo/booking~travel_id
        FIELDS " client,
               uuid( ) AS booking_uuid,
               ztravel_c404_g_a~travel_uuid AS parent_uuid,
               /dmo/booking~booking_id,
               /dmo/booking~booking_date,
               /dmo/booking~customer_id,
               /dmo/booking~carrier_id,
               /dmo/booking~connection_id,
               /dmo/booking~flight_date,
               /dmo/booking~flight_price,
               /dmo/booking~currency_code,
               CASE /dmo/travel~status WHEN 'P' THEN 'N'
                                                ELSE /dmo/travel~status END AS booking_status,
                ztravel_c404_g_a~LAST_changed_at AS local_last_changed_at ).

    DELETE FROM zbksppl_c404_g_a.
    out->write( 'Adding booking supplemente data' ).

    INSERT zbksppl_c404_g_a FROM (
    SELECT FROM /dmo/book_suppl AS supp
        JOIN ztravel_c404_g_a AS trvl ON trvl~travel_id = supp~travel_id
        JOIN zbooking_c40_g_a AS book ON book~parent_uuid = trvl~travel_uuid
                                     AND book~booking_id = supp~booking_id
        FIELDS
        uuid( )           AS booksuppl_uuid,
        trvl~travel_uuid   AS root_uuid,
        book~booking_uuid AS parent_uuid,
        supp~booking_supplement_id,
        supp~supplement_id,
        supp~price,
        supp~currency_code,
        trvl~last_changed_at AS local_last_changed_at ).

    out->write( 'DONE!' ).
  ENDMETHOD.
ENDCLASS.

***CLASS zcl_insert_data_dpp IMPLEMENTATION.
***  METHOD if_oo_adt_classrun~main.
***    DATA: lt_travel   TYPE TABLE OF ztb_travel_dpp,
***          lt_booking  TYPE TABLE OF ztb_booking_dpp,
***          lt_book_sup TYPE TABLE OF ztb_booksuppl_dp.
***
***    SELECT
***            travel_id,
***            agency_id,
***            customer_id,
***            begin_date,
***            end_date,
***            booking_fee,
***            total_price,
***            currency_code,
***            description,
***            status AS overall_status,
***            createdby AS created_by,
***            createdat AS created_at,
***            lastchangedby AS last_changed_by,
***            lastchangedat AS last_changed_at
***        FROM /dmo/travel
***        INTO CORRESPONDING FIELDS OF TABLE @lt_travel
***        UP TO 50 ROWS.
***
***    SELECT *
***        FROM /dmo/booking
***        FOR ALL ENTRIES IN @lt_travel
***        WHERE travel_id = @lt_travel-travel_id
***        INTO CORRESPONDING FIELDS OF TABLE @lt_booking.
***
***    SELECT * FROM /dmo/book_suppl
***        FOR ALL ENTRIES IN @lt_booking
***        WHERE travel_id = @lt_booking-travel_id
***            AND booking_id = @lt_booking-booking_id
***        INTO CORRESPONDING FIELDS OF TABLE @lt_book_sup.
***
***    DELETE FROM:
***        ztb_travel_dpp,
***        ztb_booking_dpp,
***        ztb_booksuppl_dp.
***
***    INSERT:
***        ztb_travel_dpp FROM TABLE @lt_travel,
***        ztb_booking_dpp FROM TABLE @lt_booking,
***        ztb_booksuppl_dp FROM TABLE @lt_book_sup.
***
***    out->write( 'DONE!' ).
***  ENDMETHOD.
***ENDCLASS.

