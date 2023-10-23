CLASS zbr_taxengine_impl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_gslog_ext_tax_calc_payload .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZBR_TAXENGINE_IMPL IMPLEMENTATION.


  METHOD if_gslog_ext_tax_calc_payload~extend_payload.

     IF pricing_header-bukrs = '1410'.

       Try.
         DATA(afd_data) = lfd_for_consumption->get_all_entries_for_doc( '' ).

         Loop at afd_data into DATA(afd_line) WHERE document_key_2 = '00010'.
            if afd_line-txs_business_transaction = 'S001'.
               payload-_items[ 1 ]-item_classifications[ 1 ]-isc_code = '33030010'.
            ENDIF.
         ENDLOOP.

       ENDTRY.

     ENDIF.

  ENDMETHOD.
ENDCLASS.
