CLASS zsendmail DEFINITION

  PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.

      CLASS-METHODS get_instance
      RETURNING
        VALUE(ro_instance) TYPE REF TO zsendmail.

    CLASS-METHODS send_email
          importing lt_email  type string
                    lt_numdoc type string
                    lt_client type string.

    PRIVATE SECTION.
         CLASS-DATA mo_instance TYPE REF TO zsendmail.
         DATA mv_bp TYPE string.
ENDCLASS.



CLASS ZSENDMAIL IMPLEMENTATION.


  METHOD get_instance.
    IF mo_instance IS NOT BOUND.
      mo_instance = NEW zsendmail( ).
    ENDIF.
    ro_instance = mo_instance.
  ENDMETHOD.


method send_email.

    data x_body   type String.
    concatenate  'This is a test for sales doc='  lt_numdoc  ' for the client:'  lt_client into x_body.

*    DATA lo_j1bnfe_print  TYPE REF TO cl_j1bnfe_danfe_print.

*    data(lo_fdp_util) = cl_fp_fdp_services=>get_instance( 'J_1BNFE_OUTPUT_MANAGEMENT_400_SRV' ).
*    data(lt_keys)     = lo_fdp_util->get_keys( ).
*      lt_keys[ name = 'ID' ]-value = '1'.
*      data(lv_xml) = lo_fdp_util->read_to_xml( lt_keys ).


*    TRY.
**    Render PDF
*        cl_fp_ads_util=>render_pdf( EXPORTING iv_xml_data      = lv_xml
*                                              iv_xdp_layout    = ls_item_data
*                                              iv_locale        = 'de_DE'
*                                              is_options       = ls_options
*                                    IMPORTING ev_pdf           = ev_pdf
*                                              ev_pages         = ev_pages
*                                              ev_trace_string  = ev_trace_string
*                                              ).
*
*      CATCH cx_fp_ads_util INTO lx_fp_ads_util.
*
*    ENDTRY.




    try.
        data(lo_mail) = cl_bcs_mail_message=>create_instance( ).
        data x_email type lo_mail->ty_address.
        x_email = lt_email.

        lo_mail->set_sender( 'do.not.reply@my400810.mail.lab.s4hana.cloud.sap' ).
        lo_mail->add_recipient( x_email ).
        lo_mail->add_recipient( iv_address = 'william.terceiro01@sap.com' iv_copy = cl_bcs_mail_message=>cc ).
        lo_mail->set_subject( 'ABAP Test Mail Envio DANFE teste2' ).
        lo_mail->set_main( cl_bcs_mail_textpart=>create_instance(
          iv_content      = '<h1>Hello</h1><p>This is a test mail.</p>'
          iv_content_type = 'text/html'
        ) ).
        lo_mail->add_attachment( cl_bcs_mail_textpart=>create_instance(
          iv_content      = x_body
          iv_content_type = 'text/plain'
          iv_filename     = 'Text_DANFE_Attachment.txt'
        ) ).
        lo_mail->send( importing et_status = data(lt_status) ).
      catch cx_bcs_mail into data(lx_mail).

    endtry.


ENDMETHOD.
ENDCLASS.
