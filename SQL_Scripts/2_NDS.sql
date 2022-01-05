---- Nhom TTKD12
-- Script to create TTKD12_UKAccidents_NDS database
----------------

USE master
GO

DROP DATABASE IF EXISTS TTKD12_UKAccidents_NDS
GO

CREATE DATABASE TTKD12_UKAccidents_NDS
GO
​
USE TTKD12_UKAccidents_NDS
GO
​
------------ CREATE TABLE
CREATE TABLE SexCasualty (
	SexCasualtyId INT PRIMARY KEY,
	SexCasualtyDetail VARCHAR(30) NOT NULL,
)
GO
​
CREATE TABLE AgeBandCasualty (
	AgeBandCasualtyId INT PRIMARY KEY,
	AgeBandCasualtyDetail VARCHAR(30) NOT NULL
)
GO
​
CREATE TABLE CasualtySeverity (
	CasualtySeverityId INT PRIMARY KEY,
	CasualtySeverityDetail VARCHAR(10) NOT NULL
)
GO
​
CREATE TABLE CasualtyType (
	CasualtyTypeId INT PRIMARY KEY,
	CasualtyTypeDetail VARCHAR(60) NOT NULL 
)
GO
​
CREATE TABLE LocalAuthorityDistrict (
	LocalAuthorityDistrictId INT PRIMARY KEY,
	LocalAuthorityDistrictDetail VARCHAR(40) NOT NULL
)
GO
​
CREATE TABLE RoadType(
	RoadTypeId INT PRIMARY KEY,
	RoadTypeDetail VARCHAR(30) NOT NULL
)
GO
​
CREATE TABLE Country (
	CountryId INT PRIMARY KEY IDENTITY(1,1),
	CountryName VARCHAR(20) NOT NULL
)
GO
​
CREATE TABLE Region (
	RegionId INT PRIMARY KEY IDENTITY(1, 1),
	RegionName VARCHAR(30),
	CountryId INT,
​
	CONSTRAINT FK_Region_Country FOREIGN KEY (CountryId)
	REFERENCES dbo.Country(CountryId)
)
GO
​
CREATE TABLE County(
	CountyId INT PRIMARY KEY IDENTITY(1,1),
	CountyName VARCHAR(30),
	RegionId INT,
​
	CONSTRAINT FK_County_Region FOREIGN KEY (RegionId)
	REFERENCES dbo.Region(RegionId)
)
GO
​
CREATE TABLE Town (
	TownId INT PRIMARY KEY IDENTITY(1, 1),
	TownName VARCHAR(30),
	CountyId INT,
​
	CONSTRAINT FK_Town_County FOREIGN KEY (CountyId)
	REFERENCES dbo.County (CountyId)
)
GO
​
CREATE TABLE Year (
	YearId INT PRIMARY KEY IDENTITY(1,1),
	Year INT NOT NULL,
​
	CONSTRAINT CK_Year CHECK(Year BETWEEN 1970 AND 2021)
)
GO
​
CREATE TABLE Quarter (
	QuarterId INT PRIMARY KEY IDENTITY(1, 1),
	Quarter INT NOT NULL,
	YearId INT NOT NULL,
​
	CONSTRAINT CK_Quarter CHECK(Quarter BETWEEN 1 AND 4),
	CONSTRAINT FK_Quarter_Year FOREIGN KEY (YearId)
	REFERENCES dbo.Year(YearId)
)
GO
​
CREATE TABLE Month (
	MonthId INT PRIMARY KEY IDENTITY(1,1),
	Month INT NOT NULL,
	QuarterId INT NOT NULL,
​
	CONSTRAINT CK_Month CHECK(Month BETWEEN 1 AND 12),
	CONSTRAINT FK_Month_Quarter FOREIGN KEY (QuarterId)
	REFERENCES dbo.Quarter (QuarterId)
)
GO
​
CREATE TABLE Day (
	DayId INT PRIMARY KEY IDENTITY(1, 1),
	Day INT NOT NULL,
	MonthId INT NOT NULL,
​
	CONSTRAINT CK_Day CHECK(Day BETWEEN 1 AND 31),
	CONSTRAINT FK_Day_Month FOREIGN KEY (MonthId)
	REFERENCES dbo.Month(MonthId)
)
GO
​
CREATE TABLE UrbanRuralArea (
	UrbanRuralAreaId INT PRIMARY KEY,
	UrbanRuralAreaDetail VARCHAR(20) NOT NULL,
)
GO
​
CREATE TABLE VehicleType (
	VehicleTypeId INT PRIMARY KEY,
	VehicleTypeDetail VARCHAR(40) NOT NULL
)
GO
​
CREATE TABLE JourneyPurposeDriver (
	JourneyPurposeDriverId INT PRIMARY KEY,
	JourneyPurposeDriverDetail VARCHAR(30)
)
GO
​
CREATE TABLE Builduproad (
	BuilduproadId INT PRIMARY KEY,
	BuilduproadDetail VARCHAR(20),
)
GO

CREATE TABLE AccidentSeverity (
	AccidentSeverityId INT PRIMARY KEY,
	AccidentSeverityDetail VARCHAR(10) NOT NULL
)
GO
​
CREATE TABLE Accident (
	AccidentId INT PRIMARY KEY IDENTITY(1, 1),
	AccidentIndex VARCHAR(13) NOT NULL,
	AccidentSeverity INT,
	NumberVehicles INT,
	NumberCasualties INT,
	Time VARCHAR(11),
	LocationEastingOSGR INT,
	LocationNorthingOSGR INT,
	Longitude FLOAT,
	Latitude FLOAT,
	SpeedLimit INT,
	LocalAuthorityDistrictId INT,
	RoadTypeId INT,
	UrbanRuralAreaId INT,
	BuildUpRoadId INT,
	TownId INT,
	DayId INT,
​
	CONSTRAINT FK_Accident_LAD FOREIGN KEY(LocalAuthorityDistrictId)
	REFERENCES dbo.LocalAuthorityDistrict(LocalAuthorityDistrictId),
​
	CONSTRAINT FK_Accident_RoadType FOREIGN KEY(RoadTypeId)
	REFERENCES dbo.RoadType(RoadTypeId),
​
	CONSTRAINT FK_Accident_Urban FOREIGN KEY(UrbanRuralAreaId)
	REFERENCES dbo.UrbanRuralArea(UrbanRuralAreaId),
​
	CONSTRAINT FK_Accident_BuildUpRoad FOREIGN KEY(BuildUpRoadId)
	REFERENCES dbo.Builduproad(BuilduproadId),
​
	CONSTRAINT FK_Accident_Town FOREIGN KEY(TownId)
	REFERENCES dbo.Town(TownId),
​
	CONSTRAINT FK_Accident_Day FOREIGN KEY(DayId)
	REFERENCES dbo.Day(DayId),

	CONSTRAINT FK_Accident_AccidentSeverity FOREIGN KEY (AccidentSeverity) 
	REFERENCES dbo.AccidentSeverity (AccidentSeverityId)
)
GO 
​
CREATE TABLE Vehicle (
	VehicleId INT PRIMARY KEY IDENTITY(1, 1),
	AccidentId INT,
	VehicleReference INT,
	VehicleTypeId INT,
	JourneyPurposeDriverId INT,
​
	CONSTRAINT FK_Vehicle_VT FOREIGN KEY(VehicleTypeId)
	REFERENCES dbo.VehicleType(VehicleTypeId),
​
	CONSTRAINT FK_Vehicle_Accident FOREIGN KEY(AccidentId)
	REFERENCES dbo.Accident(AccidentId),
​
	CONSTRAINT FK_Vehicle_JourneyPurposeDriver FOREIGN KEY(JourneyPurposeDriverId)
	REFERENCES dbo.JourneyPurposeDriver(JourneyPurposeDriverId)
)
GO
CREATE TABLE Casualty (
	CasualtyId INT PRIMARY KEY IDENTITY(1, 1),
	AccidentId INT,
	VehicleReference INT,
	CasualtyReference INT,
	CasualtyClassify INT,
	AgeCasualty INT,
	SexCasualtyId INT,
	AgeBandCasualtyId INT,
	CasualtySeverityId INT,
	CasualtyTypeId INT,
	CreatedDate DATETIME,
	UpdatedDate DATETIME,
​
	CONSTRAINT FK_Casualty_Accident FOREIGN KEY(AccidentId)
	REFERENCES dbo.Accident(AccidentId),
​
	CONSTRAINT FK_Casualty_Sex FOREIGN KEY(SexCasualtyId)
	REFERENCES dbo.SexCasualty(SexCasualtyId),
​
	CONSTRAINT FK_Casualty_AgeBand FOREIGN KEY(AgeBandCasualtyId)
	REFERENCES dbo.AgeBandCasualty(AgeBandCasualtyId),
​
	CONSTRAINT FK_Casualty_Severity FOREIGN KEY(CasualtySeverityId)
	REFERENCES dbo.CasualtySeverity(CasualtySeverityId),
​
	CONSTRAINT FK_Casualty_Type FOREIGN KEY(CasualtyTypeId)
	REFERENCES dbo.CasualtyType(CasualtyTypeId)
)
GO