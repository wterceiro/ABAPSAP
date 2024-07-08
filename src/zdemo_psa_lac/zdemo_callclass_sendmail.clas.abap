CLASS zdemo_callclass_sendmail DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
         INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZDEMO_CALLCLASS_SENDMAIL IMPLEMENTATION.


   METHOD if_oo_adt_classrun~main.
    out->write( | Names of beer gardens in Heidelberg (Germany) found on OpenStreetMaps. | ).

    data test TYPE c length 4.
    data x_email type string value 'wterceiro@gmail.com'.
    data x_cliente type string value '0014100001'.
    data x_numdoc  type string value '9400000097'.
    data x_tenant  type string value '080'.


     out->write( 'Teste envio e-mail EJ0' ).

    DATA(lo_buffer) = zsendmail=>get_instance( ).
     DATA lv_BusinessPartner TYPE string.
     data rx_result type string.

     rx_result = lo_buffer->send_email(  lt_email = x_email  lt_numdoc = x_numdoc  lt_client = x_cliente lt_tenant = x_tenant  ).


      out->write( rx_result ).

   ENDMETHOD.
ENDCLASS.
