*CLASS zglx_yy_gr02_purch_check_class DEFINITION
*  PUBLIC
*  FINAL
*  CREATE PUBLIC .
*
*  PUBLIC SECTION.
*
*    INTERFACES if_badi_interface .
*    INTERFACES if_mm_pur_s4_pr_check .
*  PROTECTED SECTION.
*  PRIVATE SECTION.
*ENDCLASS.
*
*
*
*CLASS zglx_yy_gr02_purch_check_class IMPLEMENTATION.
*
*
*  METHOD if_mm_pur_s4_pr_check~check.
*  ENDMETHOD.
*ENDCLASS.

CLASS zglx_yy_gr02_purch_check_class DEFINITION
PUBLIC
FINAL
CREATE PUBLIC .
PUBLIC SECTION.
INTERFACES if_badi_interface .
INTERFACES if_mm_pur_s4_pr_check .
PROTECTED SECTION.
PRIVATE SECTION.
ENDCLASS.



CLASS ZGLX_YY_GR02_PURCH_CHECK_CLASS IMPLEMENTATION.


METHOD if_mm_pur_s4_pr_check~check.
if sy-uname = 'CB9980000127' or ( cl_abap_context_info=>get_user_technical_name( ) ) = 'CB9980000127'
or sy-uname = 'CB9980000161' or ( cl_abap_context_info=>get_user_technical_name( ) ) = 'CB9980000161'
or sy-uname = 'CB9980000160' or ( cl_abap_context_info=>get_user_technical_name( ) ) = 'CB9980000160'
or sy-uname = 'CB9980000134' or ( cl_abap_context_info=>get_user_technical_name( ) ) = 'CB9980000134'. "CB9980000134
data ls_message type mmpur_s_messages.
Read table purchaserequisitionItem_table into data(ls_pur_req_itm) index 1.
if ls_pur_req_itm-orderedquantity > 10.
ls_message-messageid = 'DUMMY'.
ls_message-messagetype = 'E'.
ls_message-messagenumber = '001'.
ls_message-messagevariable1 = 'Les dije que menos de 10 por dios'. "'Quantity Limit Greater 10'.
append ls_message to messages.
endif.
if ls_pur_req_itm-deliverydate - ( cl_abap_context_info=>get_system_date( ) ) > 180.
ls_message-messageid = 'DUMMY'.
ls_message-messagetype = 'E'.
ls_message-messagenumber = '001'.
ls_message-messagevariable1 = 'amazon me lo traeria en menos de 180 dias'."'Delivere data greater 180 days'.
append ls_message to messages.
endif.
Endif.
ENDMETHOD.
ENDCLASS.
