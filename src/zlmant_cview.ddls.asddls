@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZLMANT_CView as projection on ZZLMANT_View1
{
    @EndUserText.label: 'Id'
    key Id,
    
    @EndUserText.label: 'Num Doc'
    @Search.defaultSearchElement: true
    Docnumber,    
 
    @EndUserText.label: 'DataDoc'
    @Search.defaultSearchElement: true
    Datadoc,
    @EndUserText.label: 'Moeda'
    Curkey,
    @EndUserText.label: 'Valor'  
    Valor,
    @EndUserText.label: 'UUID'  
    Uuid,
    @EndUserText.label: 'Active'  
    Active,    
    @EndUserText.label: 'ValorImpostos'  
    Valorimp,
    @EndUserText.label: 'Region'
    Region,
    @EndUserText.label: 'Age'
    Age,
    LastChangedAt,
    LocalLastChangedAt    
}
