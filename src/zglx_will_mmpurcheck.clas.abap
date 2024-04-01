CLASS zglx_will_mmpurcheck DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_mm_pur_s4_pr_check .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZGLX_WILL_MMPURCHECK IMPLEMENTATION.


  METHOD if_mm_pur_s4_pr_check~check.

        IF sy-uname = 'CB9980000000' OR ( cl_abap_context_info=>get_user_technical_name( ) ) = 'CB9980000000'.

              DATA ls_message TYPE mmpur_s_messages.
*            *
            READ TABLE  purchaserequisitionitem_table  INTO DATA(ls_pur_req_itm) INDEX 1    .

            IF ls_pur_req_itm-orderedquantity > 10.
              ls_message-messageid = 'DUMMY'.
              ls_message-messagetype = 'E'.
              ls_message-messagenumber = '001'.
              ls_message-messagevariable1 = 'WRM-Quantity limit 10'.           "Place holder
              APPEND ls_message TO messages.

            ENDIF.

            IF ls_pur_req_itm-deliverydate - ( cl_abap_context_info=>get_system_date( ) ) > 180.
              ls_message-messageid = 'DUMMY'.
              ls_message-messagetype = 'E'.
              ls_message-messagenumber = '001'.
              ls_message-messagevariable1 = 'WRM-Delivery date limit 180 days '.           "Place holder
              APPEND ls_message TO messages.

            ENDIF.
        ENDIF.

  ENDMETHOD.
ENDCLASS.
