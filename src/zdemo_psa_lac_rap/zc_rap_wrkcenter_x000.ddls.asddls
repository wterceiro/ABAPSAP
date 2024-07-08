@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_RAP_WRKCENTER_X000'
@ObjectModel.semanticKey: [ 'WorkcenterinternalID', 'Workcentertypecode' ]
define root view entity ZC_RAP_WRKCENTER_X000
  provider contract transactional_query
  as projection on ZR_RAP_WRKCENTER_X000
{
  key WorkcenterinternalID,
  key Workcentertypecode,
  Workcenter,
  Costcenter,
  Plant,
  Supplyarea,
  Workcenterusage,
  Matlcompismarkedforbackflush,
  RatingNum,
  LocalLastChangedAt
  
}
