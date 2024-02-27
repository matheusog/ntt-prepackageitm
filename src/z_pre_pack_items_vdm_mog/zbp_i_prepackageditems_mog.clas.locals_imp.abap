CLASS lhc_Pre_Package DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Pre_Package RESULT result.

    METHODS calculate_package_id FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Pre_Package~calculate_package_id.

ENDCLASS.

CLASS lhc_Pre_Package IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD calculate_package_id.
    DATA:
      pre_packages TYPE TABLE FOR UPDATE ZI_PrePackagedItems_MOG,
      pre_package  TYPE STRUCTURE FOR UPDATE ZI_PrePackagedItems_MOG.

    "Possible to use interval number range

    SELECT MAX( PackageId ) FROM ZI_PrePackagedItems_MOG INTO @DATA(max_pckg_id).

    READ ENTITIES OF ZI_PrePackagedItems_MOG IN LOCAL MODE
       ENTITY Pre_Package
        ALL FIELDS
          WITH CORRESPONDING #( keys )
          RESULT DATA(lt_pre_package_result)
      FAILED    DATA(lt_failed)
      REPORTED  DATA(lt_reported).

    DATA(today) = cl_abap_context_info=>get_system_date( ).
    DATA(time) = cl_abap_context_info=>get_system_time( ).
    DATA(user) = cl_abap_context_info=>get_user_technical_name( ).

    LOOP AT lt_pre_package_result INTO DATA(pre_package_read).
      max_pckg_id += 1.

      pre_package               = CORRESPONDING #( pre_package_read ).
      pre_package-PackageId     = max_pckg_id.
      pre_package-CreationDate  = today.
      pre_package-CreationTime  = time.
      pre_package-CreationUser  = user.
      APPEND pre_package TO pre_packages.
    ENDLOOP.

    MODIFY ENTITIES OF ZI_PrePackagedItems_MOG IN LOCAL MODE
    ENTITY Pre_Package UPDATE SET FIELDS WITH pre_packages "SET FIELDS WITH
    MAPPED   DATA(ls_mapped_modify)
    FAILED   DATA(lt_failed_modify)
    REPORTED DATA(lt_reported_modify).

  ENDMETHOD.

ENDCLASS.
