CLASS zcl_838272_internaltables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_838272_internaltables IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.


Data number  type i value 12.
data numbers type table of i.

do number times.
  append sy-index to numbers.
enddo.

out->write( numbers ).

data fligths type /dmo/T_flight.

select * from /dmo/flight into table @fligths.

out->write( fligths ).
out->write( fligths[ 2 ] ).



EndMETHOD.


ENDCLASS.
