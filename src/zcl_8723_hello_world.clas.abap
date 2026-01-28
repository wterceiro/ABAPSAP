CLASS zcl_8723_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_8723_hello_world IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.
* Data Objects with Built-in Types
**********************************************************************

    " comment/uncomment the following declarations and check the output
    DATA variable TYPE string.
    DATA variablei TYPE i.
    DATA variabled TYPE d.
    DATA variablef type f.
    DATA variablec TYPE c LENGTH 10.
    DATA variablen TYPE n LENGTH 10.
    DATA variablep TYPE p LENGTH 8 DECIMALS 2.



*Isto serve para print mensagem na console
    out->write( 'Hello World!  this is a test Abap Training' ).

*exemplo de uso de variables.

    out->write(  'Result with Initial Value)' ).
    out->write(   variable ).
    out->write(  '---------' ).

    variable = '19891109'.

    out->write(  'Result with Value 19891109' ).
    out->write(   variable ).
    out->write(  '---------' ).

    variablei = '19891109'.

    out->write(  'Result with Value integer' ).
    out->write(   variablei ).
    out->write(  '---------' ).

    variabled = '19891109'.

    out->write(  'Result with Value date' ).
    out->write(   variabled ).
    out->write(  '---------' ).

    variablec = '19891109'.

    out->write(  'Result with Value char' ).
    out->write(   variablec ).
    out->write(  '---------' ).

    variablen = '19891109'.

    out->write(  'Result with Value num' ).
    out->write(   variablen ).
    out->write(  '---------' ).

    variablep = '19891109'.

    out->write(  'Result with Value pack' ).
    out->write(   variablep ).
    out->write(  '---------' ).

    variablef = '19891109'.

    out->write(  'Result with Value float' ).
    out->write(   variablef ).
    out->write(  '---------' ).

* Example 1: Local Types
**********************************************************************

* Comment/Uncomment the following lines to change the type of my_var
    TYPES my_type TYPE p LENGTH 3 DECIMALS 2.
    TYPES my_typei TYPE i .
    TYPES my_types TYPE string.
    TYPES my_typen TYPE n length 10.

* Variable based on local type
    DATA my_variable TYPE my_type.

    my_variable =  '198.91'.

    out->write(  `my_variable (TYPE MY_TYPE)` ).
    out->write(   my_variable ).

* Variable based on local type
    DATA my_variablei TYPE my_typei.

    my_variablei = '19891109'.

    out->write(  `my_variablei (TYPE MY_TYPEi)` ).
    out->write(   my_variablei ).


* Variable based on local type
    DATA my_variables TYPE my_types.

    my_variables = '19891109'.

    out->write(  `my_variables (TYPE MY_TYPEs)` ).
    out->write(   my_variables ).


* Variable based on local type
    DATA my_variablen TYPE my_typen.

    my_variablen = '19891109'.

    out->write(  `my_variablen (TYPE MY_TYPEn)` ).
    out->write(   my_variablen ).


* Example 2: Global Types
**********************************************************************

* Variable based on global type .
    " Place cursor on variable and press F2 or F3
    types type_air type /dmo/airport_id.
    DATA airport TYPE /dmo/airport_id VALUE 'FRA'.
    data airport1 type type_air.
    data airport2 type type_air.

    airport1 = 'GRU'.
    airport2 = 'MXN'.

    out->write(  `airport (TYPE /DMO/AIRPORT_ID )` ).
    out->write(   airport ).
    out->write(   airport1 ).
    out->write(   airport2 ).

* Example 3: Constants
**********************************************************************

    CONSTANTS c_text   TYPE string VALUE `Hello World`.
    CONSTANTS c_number TYPE i      VALUE 12345.

    "Uncomment this line to see syntax error ( VALUE is mandatory)
*  constants c_text2   type string.

    out->write(  `c_text (TYPE STRING)` ).
    out->write(   c_text ).
    out->write(  '---------' ).

    out->write(  `c_number (TYPE I )` ).
    out->write(   c_number ).
    out->write(  `---------` ).

* Example 4: Literals
**********************************************************************

    out->write(  '12345               ' ).    "Text Literal   (Type C)
    out->write(  `12345               ` ).    "String Literal (Type STRING)
    out->write(  12345                  ).    "Number Literal (Type I)

    "uncomment this line to see syntax error (no number literal with digits)
*    out->write(  12345.67                  ).

DAta my_var1 type i.
data my_var2 type i value 1234.
data my_var3 type String.

my_var1 = my_var2.
my_var3 = 'Hello World'.

out->write(  my_var1 ).
out->write(  my_var2 ).
out->write(  my_var3 ).

clear my_var1.
clear my_var2.
clear my_var3.

out->write(  'after clear' ).
out->write(  my_var1 ).
out->write(  my_var2 ).
out->write(  my_var3 ).
out->write(  '----------' ).

* Example 5: Variables and Constants
**********************************************************************

    CONSTANTS c_text1   TYPE string VALUE `Hello World`.
    CONSTANTS c_number1 TYPE i      VALUE 12345.

    DATA(text)   = c_text1.
    DATA(number) = c_number1.

    out->write(  `text (TYPE STRING)` ).
    out->write(   text ).
    out->write( c_number1 ).
    out->write(  '---------' ).



ENDMETHOD.


ENDCLASS.
