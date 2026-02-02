CLASS zcl_console_main DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_console_main IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

  DATA(lo_demo) = NEW zcl_console_demo( ).
  out->write(  lo_demo->show_data( ) ).
  out->write(  lo_demo->show_data2(  )  ).
  out->write(  lo_demo->show_data3(  ) ).
endMETHOD.

ENDCLASS.
