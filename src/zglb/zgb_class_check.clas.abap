CLASS ZGB_CLASS_CHECK DEFINITION
    PUBLIC
    FINAL
    CREATE PUBLIC .
    PUBLIC SECTION.
    INTERFACES if_badi_interface .
    INTERFACES if_mm_pur_s4_pr_check .
    PROTECTED SECTION.
    PRIVATE SECTION.
ENDCLASS.



CLASS ZGB_CLASS_CHECK IMPLEMENTATION.


    METHOD if_mm_pur_s4_pr_check~check.
        if sy-uname = 'CB9980000000' or ( cl_abap_context_info=>get_user_technical_name( ) ) = 'CB9980000000'.
        data ls_message type mmpur_s_messages.
        Read table purchaserequisitionItem_table into data(ls_pur_req_itm) index 1.
        if ls_pur_req_itm-orderedquantity > 10.
        ls_message-messageid = 'DUMMY'.
        ls_message-messagetype = 'E'.
        ls_message-messagenumber = '001'.
        ls_message-messagevariable1 = 'Quantity Limit Greater 10'.
        append ls_message to messages.
        endif.
        if ls_pur_req_itm-deliverydate - ( cl_abap_context_info=>get_system_date( ) ) > 180.
        ls_message-messageid = 'DUMMY'.
        ls_message-messagetype = 'E'.
        ls_message-messagenumber = '001'.
        ls_message-messagevariable1 = 'Delivere data greater 180 days'.
        append ls_message to messages.
        endif.
        Endif.
    ENDMETHOD.
ENDCLASS.
