CLASS zclsgroup24 DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS get_instance
      RETURNING
        VALUE(ro_instance) TYPE REF TO zclsgroup24.

    METHODS set_costcenter
      IMPORTINg
        iv_ccenter TYPE string.

    METHODS get_costcenter
      RETURNING VALUE(rv_ccenter) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.
    CLASS-DATA mo_instance TYPE REF TO zclsgroup24.
    DATA mv_ccenter TYPE string.

ENDCLASS.

CLASS zclsgroup24 IMPLEMENTATION.
  METHOD get_costcenter.
    rv_ccenter = '55101302'.
  ENDMETHOD.

  METHOD get_instance.
    IF mo_instance IS NOT BOUND.
      mo_instance = NEW zclsgroup24( ).
    ENDIF.
    ro_instance = mo_instance.

  ENDMETHOD.

  METHOD set_costcenter.
    mv_ccenter = iv_ccenter.
  ENDMETHOD.

ENDCLASS.
