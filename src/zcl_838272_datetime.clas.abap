CLASS zcl_838272_datetime DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_838272_datetime IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

DATA: tomorrow  TYPE d,
      next_hour TYPE t,
      now type t.


DATA(user_date) = cl_abap_context_info=>GET_system_DATE( ).
FINAL(today) = CL_ABAP_CONTEXT_INFO=>GET_system_DATE( ).


" Get current UTC timestamp
GET TIME STAMP FIELD DATA(utc_timestamp).

try.

    DATA(user_timezone) = cl_abap_context_info=>get_user_time_zone( ).
    convert time STAMP utc_timestamp
            tIME ZONE user_timezone into date DATA(user_date2).
    now   = cl_abap_context_info=>get_system_time( ).

catch  CX_ABAP_CONTEXT_INFO_ERROR.
    out->write( 'Error' ).
    return.
endtry.
tomorrow  = today + 1.
next_hour = ( now + 3600 ) / 3600 * 3600.
out->write( |Today is { today } and tomorrow is { tomorrow } and now is { now } and next hour is { next_hour } and user date is { user_date }| ).
out->write( |Horario local e { user_date2  } { user_timezone }| ).

endMETHOD.


ENDCLASS.
