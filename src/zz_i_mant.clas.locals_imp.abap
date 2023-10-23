CLASS lhc_UXTeam DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR UXTeam RESULT result.

    METHODS setActive FOR MODIFY
      IMPORTING keys FOR ACTION UXTeam~setActive RESULT result.

    METHODS changeValImp FOR DETERMINE ON SAVE
      IMPORTING keys FOR UXTeam~changeValImp.

    METHODS validateAge FOR VALIDATE ON SAVE
      IMPORTING keys FOR UXTeam~validateAge.

ENDCLASS.

CLASS lhc_UXTeam IMPLEMENTATION.

  METHOD get_instance_features.

          READ ENTITIES of ZZLMANT_VIEW1 in local mode
          entity UXTeam
            Fields ( Active ) with corresponding #( keys )
          Result data(members)
          FAILED failed.

          result =
                VALUE #( FOR member in members
                       (  %key  = member-%key
                          %features-%action-setActive =  COND #( when member-Active = abap_true
                                                            then if_abap_behv=>fc-o-disabled
                                                            else if_abap_behv=>fc-o-enabled )
                                                            ) ).



  ENDMETHOD.

  METHOD setActive.

       " Do background Check
       " Check references
       " Onboard Member


       modify entities of  ZZLMANT_VIEW1 in local mode
            entity UXTeam
              update
               fields ( Active )
               with value #( for key in keys  ( %tky = key-%tky Active = abap_true
               ) )
               Failed failed
               REPORTED reported.

        READ ENTITIES of ZZLMANT_VIEW1 in local mode
          entity UXTeam
           all Fields  with corresponding #( keys )
          Result data(members).

          result = VALUE #( for member in members
                              ( %tky = member-%tky
                                %param = member ) ).


  ENDMETHOD.

  METHOD changeValImp.

       READ ENTITIES of ZZLMANT_VIEW1 in local mode
          entity UXTeam
          Fields ( Region ) with corresponding #( keys )
          Result data(members).

      Loop at members into Data(member).

         if member-Region = 'North'.
            modify entities of  ZZLMANT_VIEW1 in local mode
            entity UXTeam
              update
               fields ( Valorimp )
               with value #(  ( %tky = member-%tky Valorimp = 70
               ) ).
         endif.

         if member-Region = 'South'.
            modify entities of  ZZLMANT_VIEW1 in local mode
            entity UXTeam
              update
               fields ( Valorimp )
               with value #(  ( %tky = member-%tky Valorimp = 80
               ) ).
         endif.


      EnDloop.




  ENDMETHOD.

  METHOD validateAge.

     READ ENTITIES of ZZLMANT_VIEW1 in local mode
          entity UXTeam
          Fields ( Age ) with corresponding #( keys )
          Result data(members).


     Loop at members INTO DATA(member).

        if member-Age < 21.
           append value #( %tky = member-%tky ) to failed-uxteam.
        endif.

     endloop.






  ENDMETHOD.

ENDCLASS.
