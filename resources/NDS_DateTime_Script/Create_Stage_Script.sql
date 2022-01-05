---- Nhom TTKD12
-- Script to create database TTKD12_UKAccidents_Statge
----------------

USE master
GO

DROP DATABASE IF EXISTS TTKD12_UKAccidents_Statge
GO

CREATE DATABASE TTKD12_UKAccidents_Statge
GO

USE TTKD12_UKAccidents_Stage
GO

CREATE TABLE [Accident1114] (
    [Accident_Index] varchar(20),
    [Location_Easting_OSGR] varchar(10),
    [Location_Northing_OSGR] varchar(10),
    [Longitude] varchar(10),
    [Latitude] varchar(20),
    [Police_Force] int,
    [Accident_Severity] int,
    [Number_of_Vehicles] int,
    [Number_of_Casualties] int,
    [Date] datetime,
    [Day_of_Week] int,
    [Time] varchar(10),
    [Local_Authority_(District)] int,
    [Local_Authority_(Highway)] varchar(30),
    [1st_Road_Class] int,
    [1st_Road_Number] int,
    [Road_Type] int,
    [Speed_limit] int,
    [Junction_Detail] int,
    [Junction_Control] int,
    [2nd_Road_Class] int,
    [2nd_Road_Number] int,
    [Pedestrian_Crossing-Human_Control] int,
    [Pedestrian_Crossing-Physical_Facilities] int,
    [Light_Conditions] int,
    [Weather_Conditions] int,
    [Road_Surface_Conditions] int,
    [Special_Conditions_at_Site] int,
    [Carriageway_Hazards] int,
    [Urban_or_Rural_Area] int,
    [Did_Police_Officer_Attend_Scene_of_Accident] int,
    [LSOA_of_Accident_Location] varchar(30)
)
CREATE TABLE [Casualties1114] (
    [Accident_Index] varchar(30),
    [Vehicle_Reference] int,
    [Casualty_Reference] int,
    [Casualty_Class] int,
    [Sex_of_Casualty] int,
    [Age_of_Casualty] int,
    [Age_Band_of_Casualty] int,
    [Casualty_Severity] int,
    [Pedestrian_Location] int,
    [Pedestrian_Movement] int,
    [Car_Passenger] int,
    [Bus_or_Coach_Passenger] int,
    [Pedestrian_Road_Maintenance_Worker] int,
    [Casualty_Type] int,
    [Casualty_Home_Area_Type] int
)
CREATE TABLE [Vehicles1114] (
    [Accident_Index] varchar(30),
    [Vehicle_Reference] int,
    [Vehicle_Type] int,
    [Towing_and_Articulation] int,
    [Vehicle_Manoeuvre] int,
    [Vehicle_Location-Restricted_Lane] int,
    [Junction_Location] int,
    [Skidding_and_Overturning] int,
    [Hit_Object_in_Carriageway] int,
    [Vehicle_Leaving_Carriageway] int,
    [Hit_Object_off_Carriageway] int,
    [1st_Point_of_Impact] int,
    [Was_Vehicle_Left_Hand_Drive?] int,
    [Journey_Purpose_of_Driver] int,
    [Sex_of_Driver] int,
    [Age_of_Driver] int,
    [Age_Band_of_Driver] int,
    [Engine_Capacity_(CC)] int,
    [Propulsion_Code] int,
    [Age_of_Vehicle] int,
    [Driver_IMD_Decile] int,
    [Driver_Home_Area_Type] int
)
CREATE TABLE [PCD_OA_LSOA_MSOA_LAD_AUG21_UK_LU] (
    [pcd7] char(9),
    [pcd8] char(10),
    [pcds] varchar(10),
    [dointr] char(8),
    [doterm] varchar(8),
    [usertype] char(3),
    [oa11cd] varchar(15),
    [lsoa11cd] varchar(15),
    [msoa11cd] varchar(15),
    [ladcd] varchar(15),
    [lsoa11nm] varchar(50),
    [msoa11nm] varchar(40),
    [ladnm] varchar(30)
)
CREATE TABLE [UKPostcodes] (
    [postcode] varchar(4),
    [easting] int,
    [northing] int,
    [latitude] varchar(10),
    [longitude] varchar(10),
    [city] varchar(50),
    [county] varchar(40),
    [country_code] char(3),
    [country_name] varchar(30),
    [iso3166-2] varchar(20),
    [region_code] varchar(10),
    [region_name] varchar(40)
)
