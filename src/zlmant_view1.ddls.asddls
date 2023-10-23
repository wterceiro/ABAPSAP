@AbapCatalog.sqlViewName: 'ZLMANT_VIEW1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View 1'
define root view ZZLMANT_View1 as select from zlmantecipo
{
    key id                              as Id,
        lmdocnumber                     as Docnumber,
        lmdatadoc                       as Datadoc,
        cuky_field                      as Curkey,
        lmvalorx                        as Valor,
        lmvalimp                        as Valorimp,
        lmuuid                          as Uuid,
        region                          as Region,
        age                             as Age,
        active                          as Active,
        @Semantics.systemDateTime.lastChangedAt: true
        last_changed_at                 as LastChangedAt,
        @Semantics.systemDateTime.localInstanceLastChangedAt: true
        local_last_changed_at           as LocalLastChangedAt
}
