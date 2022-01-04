create table AcidentSeverityPredict
(
AccidentIndex varchar(13),
AccidentSeverity varchar(10),
LocalAuthorityDistrict varchar(40),
SpeedLimit int,
UrbanRural varchar(20),
NumberVehicles int,
NumberCasualties int,
RoadType varchar(30)
)
INSERT INTO AcidentSeverityPredict
(
AccidentIndex,
AccidentSeverity,
LocalAuthorityDistrict,
SpeedLimit,
UrbanRural,
NumberVehicles,
NumberCasualties,
RoadType
) select a.AccidentIndex, a.AccidentSeverity, lad.LocalAuthorityDistrictDetail, a.SpeedLimit, ua.UrbanRuralAreaDetail, a.NumberVehicles, a.NumberCasualties, rt.RoadTypeDetail from Accident a, AccidentSeverity ase, LocalAuthorityDistrict lad, UrbanRuralArea ua, RoadType rt where a.AccidentSeverity = ase.AccidentSeverityId and a.LocalAuthorityDistrictId=lad.LocalAuthorityDistrictId and a.UrbanRuralAreaId = ua.UrbanRuralAreaId and a.RoadTypeId = rt.RoadTypeId