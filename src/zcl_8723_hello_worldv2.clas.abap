CLASS zcl_8723_hello_worldv2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_8723_hello_worldv2 IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

* Declarations
**********************************************************************

    " comment/uncomment these line for different result types
    TYPES t_result TYPE p LENGTH 8 DECIMALS 2.
*    TYPES t_result TYPE p LENGTH 8 DECIMALS 0.
*    TYPES t_result TYPE i.

    DATA result TYPE t_result.
    DATA result2 TYPE t_result.
    DATA result3 TYPE t_result.
    DATA result4 TYPE t_result.
    DATA result5 TYPE t_result.
    DATA result6 TYPE t_result.
    DATA result7 TYPE t_result.

* Calculations
**********************************************************************
    " comment/uncomment these lines for different calculations

    result = 2 + 3.
    result2 = 2 - 3.
    result3 = 2 * 3.
    result4 = 2 / 3.
*
    result5 = sqrt( 2 ).
    result6 = ipow( base = 2 exp = 3 ).
*             log(num)   / log(base).
    result7 = log( 300 ) / log( 10 ).
*
*    result = ( 8 * 7 - 6 ) / ( 5 + 4 ).
*   result = 8 * 7 - 6 / 5 + 4.

* Output
**********************************************************************

    out->write( result ).
    out->write( result2 ).
    out->write( result3 ).
    out->write( result4 ).
    out->write( result5 ).
    out->write( result6 ).
    out->write( result7 ).
    data: lv_value2 type p decimals 2.
    lv_value2 =  exp( result7  * log( 10 ) ) .
    out->write( lv_value2 ).

    data the_date type d value '19891130'.
    out->write( |{ the_date }| ).
    out->write( |{ the_date DATE = USER }| ).
    out->write( |{ the_date DATE = ISO }| ).


EndMETHOD.

ENDCLASS.
