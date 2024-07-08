CLASS z_tax_brl_payloadv3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_gslog_ext_tax_calc_payload .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS Z_TAX_BRL_PAYLOADV3 IMPLEMENTATION.


  METHOD if_gslog_ext_tax_calc_payload~extend_payload.
             payload-gross_or_net = 'g'.



*      LOOP AT payload-_items ASSIGNING FIELD-SYMBOL(<fs_item>).
*        LOOP AT <fs_item>-additional_item_information ASSIGNING FIELD-SYMBOL(<fs_info>).
*
*          CHECK <fs_info>-type = 'CPRB'.
*          <fs_info>-information = 'Y'.
*
*        ENDLOOP.
*      ENDLOOP.



  ENDMETHOD.
ENDCLASS.
