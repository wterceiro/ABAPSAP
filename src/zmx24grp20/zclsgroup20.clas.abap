CLASS zclsgroup20 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS get_instance
      RETURNING
        VALUE(ro_instance) TYPE REF TO ZCLSGROUP20.

    METHODS set_costcenter
      IMPORTING
        iv_ccenter TYPE string.

    METHODS get_costcenter
      RETURNING VALUE(rv_ccenter) TYPE string.


  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA mo_instance TYPE REF TO ZCLSGROUP20.
    DATA mv_ccenter TYPE string.

ENDCLASS.



CLASS zclsgroup20 IMPLEMENTATION.
  METHOD get_costcenter.
    rv_ccenter = '55101302'.
  ENDMETHOD.


  METHOD get_instance.
    IF mo_instance IS NOT BOUND.
      mo_instance = NEW ZCLSGROUP20( ).
    ENDIF.

    ro_instance = mo_instance.
  ENDMETHOD.


  METHOD set_costcenter.
    mv_ccenter = iv_ccenter.
  ENDMETHOD.

ENDCLASS.
