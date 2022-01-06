---- Nhom TTKD12
-- Script to create TTKD12_UKAccidents_DDS database
----------------

USE master
GO

DROP DATABASE IF EXISTS TTKD12_UKAccidents_DDS
GO

CREATE DATABASE TTKD12_UKAccidents_DDS
GO

USE TTKD12_UKAccidents_DDS
GO

---------------- Common Dim --------------
CREATE TABLE Dim_Year (
  YearId INT PRIMARY KEY,
  Year INT
)
GO

CREATE TABLE Dim_Quarter (
  QuarterId INT PRIMARY KEY,
  YearId INT,
  Quarter INT
)
GO

CREATE TABLE Dim_Month (
  MonthId INT PRIMARY KEY,
  QuarterId INT,
  Month INT
)
GO

CREATE TABLE Dim_Day (
  DayId INT PRIMARY KEY,
  MonthId INT,
  Day INT
)
GO

CREATE TABLE Dim_Country (
	CountryId INT PRIMARY KEY,
	CountryName VARCHAR(20)
)
GO
​
CREATE TABLE Dim_Region (
	RegionId INT PRIMARY KEY,
	RegionName VARCHAR(30),
	CountryId INT,
)
GO
​
CREATE TABLE Dim_County(
	CountyId INT PRIMARY KEY IDENTITY(1,1),
	CountyName VARCHAR(30),
	RegionId INT
)
GO
​
CREATE TABLE Dim_Town (
	TownId INT PRIMARY KEY IDENTITY(1, 1),
	TownName VARCHAR(30),
	CountyId INT
)
GO 

---------------- Fact Casualty  --------------
CREATE TABLE Dim_SexCasualty (
	SexCasualtyId INT PRIMARY KEY,
	SexCasualtyDetail VARCHAR(30),
)
GO
​
CREATE TABLE Dim_AgeBandCasualty (
	AgeBandCasualtyId INT PRIMARY KEY,
	AgeBandCasualtyDetail VARCHAR(30)
)
GO
​
CREATE TABLE Dim_CasualtySeverity (
	CasualtySeverityId INT PRIMARY KEY,
	CasualtySeverityDetail VARCHAR(10)
)
GO
​
CREATE TABLE Dim_CasualtyType (
	CasualtyTypeId INT PRIMARY KEY,
	CasualtyTypeDetail VARCHAR(60)
)
GO

CREATE TABLE Dim_LocalAuthorityDistrict (
	LocalAuthorityDistrictId INT PRIMARY KEY,
	LocalAuthorityDistrictDetail VARCHAR(40)
)
GO

CREATE TABLE Dim_AgeGroupCasualty(
	AgeGroupCasualtyId INT PRIMARY KEY,
	AgeGroupCasualtyDetail VARCHAR(30) NOT NULL
)
GO

CREATE TABLE Dim_LACode (
	LACodeId INT PRIMARY KEY,
	LACodeDetail VARCHAR(30) NOT NULL
)
GO

CREATE TABLE Fact_Casualty_Statistic(
	FactCasualtyStatsId INT IDENTITY(1, 1) PRIMARY KEY,
	DayId INT,
	SexCasualtyId INT,
	AgeBandCasualtyId INT,
	CasualtyTypeId INT,
	CasualtySeverityId INT, 
	LADId INT,
	AgeCasualty INT,
	AgeGroupCasualtyId INT,
	LACodeId INT
)
GO

---------------- Fact Accident  --------------
CREATE TABLE Dim_RoadType(
	RoadTypeId INT PRIMARY KEY,
	RoadTypeDetail VARCHAR(30)
)
GO

CREATE TABLE Dim_Builduproad (
	BuilduproadId INT PRIMARY KEY,
	BuilduproadDetail VARCHAR(20),
)
GO

CREATE TABLE Dim_UrbanRuralArea (
	UrbanRuralAreaId INT PRIMARY KEY,
	UrbanRuralAreaDetail VARCHAR(20) NOT NULL,
)
GO

CREATE TABLE Dim_Time (
	TimeId INT PRIMARY KEY,
	TimeDetail VARCHAR(30) NOT NULL
)
GO

CREATE TABLE Dim_AccidentSeverity (
	AccidentSeverityId INT PRIMARY KEY,
	AccidentSeverityDetail VARCHAR(10) NOT NULL
)
GO

CREATE TABLE Fact_Accident_Statistic (
	FactAccidentStatsId INT IDENTITY(1, 1) PRIMARY KEY,
	RoadTypeId INT,
	DayId INT,
	BuilduproadId INT,
	UrbanRuralAreaId INT,
	TownId INT,
	VehicleTypeId INT,
	TimeId INT,
	AccidentSeverityId INT,
	LACodeId INT
)
GO

---------------- Fact Vehicle  --------------
CREATE TABLE Dim_VehicleType(
	VehicleTypeId INT PRIMARY KEY,
	VehicleTypeDetail VARCHAR(40)
)
GO

CREATE TABLE Dim_JourneyPurposeDriver (
	JourneyPurposeDriverId INT PRIMARY KEY,
	JourneyPurposeDriverDetail VARCHAR(30)
)
GO

CREATE TABLE Fact_Vehicle_Statistic(
	FactVehicleStatsId INT IDENTITY(1, 1) PRIMARY KEY,
	VehicleTypeId INT,
	JourneyPurposeDriverId INT,
	TownId INT,
	DayId INT
)
GO 

---------------- Fact Variance  --------------
CREATE TABLE Fact_Variance_Statistic(
	FactVarianceStatsId INT PRIMARY KEY IDENTITY(1, 1),
	DayId INT,
	Total INT
)
GO

---------------- Foreign Key --------------
ALTER TABLE Dim_Quarter
ADD	CONSTRAINT FK_Quarter_Year
FOREIGN KEY (YearId) REFERENCES Dim_Year(YearId)
GO

ALTER TABLE Dim_Month
ADD	CONSTRAINT FK_Month_Quarter
FOREIGN KEY (QuarterId) REFERENCES Dim_Quarter(QuarterId)
GO

ALTER TABLE Dim_Day
ADD	CONSTRAINT FK_Day_Month
FOREIGN KEY (MonthId) REFERENCES Dim_Month(MonthId)
GO

ALTER TABLE Dim_Region
ADD CONSTRAINT FK_Region_Country
FOREIGN KEY (CountryId) REFERENCES Dim_Country(CountryId)
GO

ALTER TABLE Dim_County
ADD CONSTRAINT FK_County_Region
FOREIGN KEY (RegionId) REFERENCES Dim_Region(RegionId)
GO

ALTER TABLE Dim_Town
ADD	CONSTRAINT FK_Town_County
FOREIGN KEY (CountyId) REFERENCES Dim_County(CountyId)
GO

-- Fact_Casualty_Statistic
ALTER TABLE Fact_Casualty_Statistic
ADD	CONSTRAINT FK_FCS_SC
FOREIGN KEY (SexCasualtyId) REFERENCES Dim_SexCasualty(SexCasualtyId)
GO

ALTER TABLE Fact_Casualty_Statistic
ADD CONSTRAINT FK_FCS_ABC
FOREIGN KEY (AgeBandCasualtyId) REFERENCES Dim_AgeBandCasualty(AgeBandCasualtyId)
GO

ALTER TABLE Fact_Casualty_Statistic
ADD CONSTRAINT FK_FCS_CS
FOREIGN KEY (CasualtySeverityId) REFERENCES Dim_CasualtySeverity(CasualtySeverityId)
GO

ALTER TABLE Fact_Casualty_Statistic
ADD CONSTRAINT FK_FCS_CT
FOREIGN KEY (CasualtyTypeId) REFERENCES Dim_CasualtyType (CasualtyTypeId)
GO

ALTER TABLE Fact_Casualty_Statistic
ADD CONSTRAINT FK_FCS_LAD
FOREIGN KEY (LADId) REFERENCES Dim_LocalAuthorityDistrict(LocalAuthorityDistrictId)
GO

ALTER TABLE Fact_Casualty_Statistic
ADD CONSTRAINT FK_FCS_Day
FOREIGN KEY (DayId) REFERENCES Dim_Day(DayId)
GO

ALTER TABLE Fact_Casualty_Statistic
ADD CONSTRAINT FK_FCS_AgeGroup
FOREIGN KEY (AgeGroupCasualtyId) REFERENCES Dim_AgeGroupCasualty(AgeGroupCasualtyId)
GO

ALTER TABLE Fact_Casualty_Statistic
ADD CONSTRAINT FK_FCS_LACode
FOREIGN KEY (LACodeId) REFERENCES Dim_LACode (LACodeId)
GO 

-- Fact_Accident_Statistic
ALTER TABLE Fact_Accident_Statistic
ADD CONSTRAINT FK_FAS_RT
FOREIGN KEY (RoadTypeId) REFERENCES Dim_RoadType(RoadTypeId)
GO

ALTER TABLE Fact_Accident_Statistic
ADD CONSTRAINT FK_FAS_Day
FOREIGN KEY (DayId) REFERENCES Dim_Day(DayId)
GO

ALTER TABLE Fact_Accident_Statistic
ADD CONSTRAINT FK_FAS_BUR
FOREIGN KEY (BuilduproadId) REFERENCES Dim_Builduproad(BuilduproadId)
GO

ALTER TABLE Fact_Accident_Statistic
ADD CONSTRAINT FK_FAS_URA
FOREIGN KEY (UrbanRuralAreaId) REFERENCES Dim_UrbanRuralArea(UrbanRuralAreaId)
GO

ALTER TABLE Fact_Accident_Statistic
ADD CONSTRAINT FK_FAS_Town
FOREIGN KEY (TownId) REFERENCES Dim_Town (TownId)
GO

ALTER TABLE Fact_Accident_Statistic
ADD CONSTRAINT FK_FAS_VT
FOREIGN KEY (VehicleTypeId) REFERENCES Dim_VehicleType (VehicleTypeId)
GO

ALTER TABLE Fact_Accident_Statistic
ADD CONSTRAINT FK_FAS_Time
FOREIGN KEY (TimeId) REFERENCES Dim_Time (TimeId)
GO

ALTER TABLE Fact_Accident_Statistic
ADD CONSTRAINT FK_FAS_AS
FOREIGN KEY (AccidentSeverityId) REFERENCES Dim_AccidentSeverity (AccidentSeverityId)
GO

ALTER TABLE Fact_Accident_Statistic
ADD CONSTRAINT FK_FAS_LACode
FOREIGN KEY (LACodeId) REFERENCES Dim_LACode (LACodeId)
GO 

-- Fact_Vehicle_Statistic
ALTER TABLE Fact_Vehicle_Statistic
ADD CONSTRAINT FK_FVS_Day
FOREIGN KEY (DayId) REFERENCES Dim_Day(DayId)
GO

ALTER TABLE Fact_Vehicle_Statistic
ADD	CONSTRAINT FK_FVS_Town
FOREIGN KEY (TownId) REFERENCES Dim_Town(TownId)
GO

ALTER TABLE Fact_Vehicle_Statistic
ADD	CONSTRAINT FK_FVS_VT
FOREIGN KEY (VehicleTypeId) REFERENCES Dim_VehicleType(VehicleTypeId)
GO

ALTER TABLE Fact_Vehicle_Statistic
ADD CONSTRAINT FK_FVS_JPD
FOREIGN KEY (JourneyPurposeDriverId) REFERENCES Dim_JourneyPurposeDriver(JourneyPurposeDriverId)
GO

-- Fact_Variance_Statistic
ALTER TABLE Fact_Variance_Statistic
ADD CONSTRAINT FK_FVS_DimDay
FOREIGN KEY (DayId) REFERENCES Dim_Day(DayId)
GO

---------------- Insert Into Dim --------------
-- Dim_AgeGroupCasualty
INSERT INTO Dim_AgeGroupCasualty ( AgeGroupCasualtyId, AgeGroupCasualtyDetail ) VALUES ( 1, 'Children: 0-15')
INSERT INTO Dim_AgeGroupCasualty ( AgeGroupCasualtyId, AgeGroupCasualtyDetail ) VALUES ( 2, 'Young adult: 16-17' )
INSERT INTO Dim_AgeGroupCasualty ( AgeGroupCasualtyId, AgeGroupCasualtyDetail ) VALUES ( 3,'Adult: 18-59' )
INSERT INTO Dim_AgeGroupCasualty ( AgeGroupCasualtyId, AgeGroupCasualtyDetail ) VALUES ( 4,'60 and over: 60-...' )
GO

-- Dim_Time
INSERT INTO Dim_Time ( TimeId, TimeDetail ) VALUES ( 1, 'Morning: 5am - 12pm' )
INSERT INTO Dim_Time ( TimeId, TimeDetail ) VALUES ( 2, 'Afternoon: 12pm - 5pm' )
INSERT INTO Dim_Time ( TimeId, TimeDetail ) VALUES ( 3, 'Evening: 5pm - 9pm' )
INSERT INTO Dim_Time ( TimeId, TimeDetail ) VALUES ( 4, 'Night: 9pm - 5pm' )
GO