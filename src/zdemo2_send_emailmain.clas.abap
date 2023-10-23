CLASS zdemo2_send_emailmain DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
        Interfaces if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZDEMO2_SEND_EMAILMAIN IMPLEMENTATION.


  method if_oo_adt_classrun~main.


    data test TYPE c length 4.
    data x_email type string value 'wterceiro@gmail.com'.
    data x_cliente type string value '0014100001'.
    data x_numdoc  type string value '9400000097'.


     out->write( 'Teste envio e-mail' ).

    DATA(lo_buffer) = zsendmail=>get_instance( ).
     DATA lv_BusinessPartner TYPE string.

     lo_buffer->send_email( lt_email = x_email  lt_numdoc = x_numdoc  lt_client = x_cliente  )..



  Endmethod.
ENDCLASS.
