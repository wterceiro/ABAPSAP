CLASS zlcl_abap DEFINITION

  PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING iv_user        TYPE sy-uname
                            it_type        TYPE string,
      get_name    RETURNING VALUE(rv_name) TYPE char40.
  PRIVATE SECTION.
    DATA: gv_user TYPE sy-uname,
          gv_type type string.

ENDCLASS.



CLASS ZLCL_ABAP IMPLEMENTATION.


  METHOD constructor.
    gv_user = iv_user.
    gv_type = it_type.
  ENDMETHOD.


  METHOD get_name.
    rv_name = 'Jagdish P'.   "This can be a query as well

  ENDMETHOD.
ENDCLASS.
