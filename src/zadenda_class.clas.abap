**********************************************************************
* William Terceiro
* Badi para Adenda
*
* Boot Camp Mexico - February 2023
*
**********************************************************************

CLASS zadenda_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_badi_interface_cust_data_v4 .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZADENDA_CLASS IMPLEMENTATION.


  METHOD if_badi_interface_cust_data_v4~fill_custom_data_v4.

 TYPES: BEGIN OF uuidline,
      related_doc_uuid TYPE c length 36,
END OF uuidline.
DATA: uuidtab TYPE  TABLE OF uuidline,
wauuid like line of uuidtab.
types:
    tt_uuid TYPE STANDARD TABLE OF uuidline WITH NON-UNIQUE DEFAULT KEY .

TYPES: BEGIN OF LINE,
      related_doc_uuid TYPE tt_uuid,
      related_doc_type TYPE c LENGTH 2,
END OF LINE.
DATA: ITAB TYPE  TABLE OF LINE ,
wa LIKE LINE OF ITAB.



  IF IS_MAPPING_SOURCE-companycode = '5510'
 and IS_MAPPING_SOURCE-accountingdocinfo-fiscalyear = '2023'
 and IS_MAPPING_SOURCE-accountingdocinfo-accountingdcoumentnum = '21000000045'.

    wa-related_doc_type = '07'.
    wauuid-related_doc_uuid  = '123e4567-e89b-12d3-a456-426614174000'.
    append wauuid to wa-related_doc_uuid.
    wauuid-related_doc_uuid  = '123e4567-e89b-12d3-a456-426614174100'.
    append wauuid to wa-related_doc_uuid.
    wauuid-related_doc_uuid  = '123e4567-e89b-12d3-a456-426614174200'.
    append wauuid to wa-related_doc_uuid.

    append wa to ct_related_doc_data.


 ENdif.






  ENDMETHOD.
ENDCLASS.
