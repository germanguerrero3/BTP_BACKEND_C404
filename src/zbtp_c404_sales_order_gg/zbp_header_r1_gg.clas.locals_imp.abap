CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      keys REQUEST requested_features FOR Header RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR Header RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR Header RESULT result.

    METHODS acceptSales FOR MODIFY
       keys FOR ACTION Header~acceptSales RESULT result.

    METHODS rejectSales FOR MODIFY
       keys FOR ACTION Header~rejectSales RESULT result.

    METHODS resume FOR MODIFY
       keys FOR ACTION Header~resume.

    METHODS setStatusToOpen FOR DETERMINE ON MODIFY
       keys FOR Header~setStatusToOpen.

    METHODS setIdNumber FOR DETERMINE ON SAVE
       keys FOR Header~setIdNumber.

ENDCLASS.

CLASS lhc_Header IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD acceptSales.
  ENDMETHOD.

  METHOD rejectSales.
  ENDMETHOD.

  METHOD resume.
  ENDMETHOD.

  METHOD setStatusToOpen.
  ENDMETHOD.

  METHOD setIdNumber.
  ENDMETHOD.

ENDCLASS.
