CLASS zcl_8723_zerodivide DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_8723_zerodivide IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

DATa result type i.
data numerador type i value 1.
data denominador type i.
data denominador2 type i.

denominador = 2.

try.
  result = numerador / denominador.
  out->write( result ).
catch cx_sy_zerodivide.
  out->write( 'Division by zero denominador' ).
endtry.

try.
  result = numerador / denominador2.
  out->write( result ).
catch cx_sy_zerodivide.
  out->write( 'Division by zero denominador2' ).
endtry.


* Declarations
**********************************************************************
    DATA numbers TYPE TABLE OF i.

* Preparation
**********************************************************************

    APPEND 123 TO numbers.

* Example 1: Conversion Error (no Number)
**********************************************************************

    CONSTANTS c_text TYPE string VALUE 'ABC'.
*    CONSTANTS c_text TYPE string VALUE '123'.

    out->write(  `---------------------------` ).
    out->write(  `Example 1: Conversion Error` ).
    out->write(  `---------------------------` ).

    TRY.
        result = c_text.
        out->write( |Converted content is { result }|  ).
      CATCH cx_sy_conversion_no_number.
        out->write( |Error: { c_text } is not a number!| ).
    ENDTRY.


* Example 3: Itab Error (Line Not Found)
**********************************************************************


    CONSTANTS c_index TYPE i VALUE 2.
*    CONSTANTS c_index TYPE i VALUE 1.

    out->write(  `-------------------------` ).
    out->write(  `Example 3: Line Not Found` ).
    out->write(  `-------------------------` ).

    TRY.
        result = numbers[ c_index ].
        out->write( |Content of row { c_index } equals { result }| ).
      CATCH cx_sy_itab_line_not_found.
        out->write(  `Error: Itab has less than { c_index } rows!` ).
    ENDtry.

* Example 4: Combination of Different Exceptions
**********************************************************************
*    CONSTANTS c_char TYPE c LENGTH 1 VALUE 'X'.
*    CONSTANTS c_char TYPE c length 1 value '0'.
    CONSTANTS c_char TYPE c LENGTH 1 VALUE '1'.
*    CONSTANTS c_char TYPE c length 1 value '2'.

    out->write(  `----------------------` ).
    out->write(  `Example 4: Combination` ).
    out->write(  `----------------------` ).

    TRY.
        result = numbers[ 2 / c_char ].
        out->write( |Result: { result } | ).
      CATCH cx_sy_zerodivide.
        out->write( `Error: Division by zero is not defined`  ).
      CATCH cx_sy_conversion_no_number.
        out->write( |Error: { c_char } is not a number! | ).
      CATCH cx_sy_itab_line_not_found.
        out->write( |Error: Itab contains less than { 2 / c_char } rows| ).
    ENDTRY.



 enDMETHOD.

ENDCLASS.
