CLASS zglx_mx_gr06_purch_check_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_mm_pur_s4_pr_check .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZGLX_MX_GR06_PURCH_CHECK_CLASS IMPLEMENTATION.


  METHOD if_mm_pur_s4_pr_check~check.

  IF sy-uname = 'CB9980000164' OR ( cl_abap_context_info=>get_user_technical_name( ) ) = 'CB9980000164'.
    DATA ls_message TYPE mmpur_s_messages.
    READ TABLE purchaserequisitionItem_table INTO DATA(ls_pur_req_itm) INDEX 1.
    IF ls_pur_req_itm-orderedquantity > 10.
      ls_message-messageid = 'DUMMY'.
      ls_message-messagetype = 'E'.
      ls_message-messagenumber = '001'.
      ls_message-messagevariable1 = 'Quantity Limit Greater 10'.
      APPEND ls_message TO messages.
    ENDIF.
    IF ls_pur_req_itm-deliverydate - ( cl_abap_context_info=>get_system_date( ) ) > 180.
      ls_message-messageid = 'DUMMY'.
      ls_message-messagetype = 'E'.
      ls_message-messagenumber = '001'.
      ls_message-messagevariable1 = 'Delivere data greater 180 days'.
      APPEND ls_message TO messages.
    ENDIF.
  ENDIF.

  ENDMETHOD.
ENDCLASS.
