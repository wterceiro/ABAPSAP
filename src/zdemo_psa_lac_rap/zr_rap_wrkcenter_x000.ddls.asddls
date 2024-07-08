@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED ZRAP_WRKCENTER_WEBX'
define root view entity ZR_RAP_WRKCENTER_X000
  as select from zrap_wrkcenter_x as WorkcenterY
{
  key workcenterinternalid as WorkcenterinternalID,
  key workcentertypecode as Workcentertypecode,
  workcenter as Workcenter,
  costcenter as Costcenter,
  plant as Plant,
  supplyarea as Supplyarea,
  workcenterusage as Workcenterusage,
  matlcompismarkedforbackflush as Matlcompismarkedforbackflush,
  rating_num as RatingNum,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
  
}
