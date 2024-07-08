CLASS zdemo1_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZDEMO1_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  out->write( 'Hello Cloud' ).
  SELECT FROM I_PROduct FIELDS product INTO TABLE @DATA(lt_mara).
  out->write( lt_mara ).


  ENDMETHOD.
ENDCLASS.
