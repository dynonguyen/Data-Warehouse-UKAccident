<h1 align="center">
 INFORMATION SYSTEM FOR BUSINESS INTELLIGENCE PROJECT
<h1>

<h2 align="center">
  BUILDING AND MINING DATA WAREHOUSE
</h2>

---

## Team TTKD-12 - HCMUS IT K18

- 1712766 - Nguyễn Chí Thanh
- 18120606 - Trần Thị Trang
- 18120609 - Hồ Khắc Minh Trí
- 18120634 - Nguyễn Lê Anh Tuấn

## Requirements and submission rules

> Build and analyze data about car accidents in the UK over 3-4 years

- **Data Description:** Describe meaning of the properties of the following data sources
  (only describe the properties necessary for the project):
  - UK Car Accidents 2005 - 2015 data (Students only takes data over 3-4 years, or
    the provided 2011-2014 data): [Reference](https://www.kaggle.com/silicon99/dft-accidentdata/discussion/28970?fbclid=IwAR1BvAiy8mEMy01XXAKtxLkX7Kx3kwPt3c3EYhwoxlWq5psikSAB2mVlF8A)
  - LSOA-Postcode Mapping data: [Reference](https://geoportal.statistics.gov.uk/datasets/postcode-to-output-areato-lower-layer-super-output-area-to-middle-layer-super-output-areato-local-authority-district-august-2021-lookup-in-the-uk/about)
  - UK-Postcodes data: [Reference](https://github.com/academe/UK-Postcodes/blob/master/postcodes.csv)
- Design data warehouse (DW), synthesize, load data from the sources into DW,
  then design and build Cube: Suggestions.
  - For England and Wales: map the above data sources to get the values for building Geography dimension with dimensional hierarchy as follows: Country > Region > County > Town City.
  - For Scotland and North Ireland, students need to suggest solutions to create values for Geography dimension.
  - Transform the datetime data to create the Date dimension with dimensional hierarchy: Year > Quarter > Month > Day.
  - Define and design other dimensional hierarchies to meet OLAP and Report requirements.

## OLAP & Report

1. Report the number of calsulities by Severity (Fatal, Serious, Slight) in the Local Authority Districts over years.
2. Report the number of calsulities by Severity (Fatal, Serious, Slight) in the Local Authority Districts by Quarters in years.
3. Report the number of faltal calsulities by Gender, Casualty Type and Age Band over years.
4. Report the number of accidents by Severity and Time of Day (Morning: 5am-12pm, Afternoon: 12pm-5pm, Evening: 5pm-9pm, Night: 9pm-5am) over years.
5. Report the number of accidents by Severity, Urban or Rural Area and Road Type over years.
6. Report the number of calsulities by Severity, Casualty Type and Age Group over years, Age Group is defined as below

- Children: 0-15
- Young adult: 0-17
- Adult: 18-59
- 60 and over: 60-...

7. Report the number of accidents by Journey Purpose and Vehicle Type.
8. Create a new attribute Built-up Road in Accidients table. Built-up Road may have 2 values.

- Built-up road: if Speed Limit below 50 mph
- Non Built-up road: if Speed Limit above 50 mph

9. Report the number of accidents by Severity, Vehicle Type, Built-up Road over years.
10. Students design other reports about UK car accident.
11. Define fact Variance to calculate the increase and the decrease of the number of car accidents in percent over years.
12. Build graphs/charts for the above reports
13. Use regional map to visually represent (by color) the number of car accidents in regions during a year.

## Data Mining: Suggestion

- Using models to predict the severity of accidents
- Students propose applications of any case, explain the algorithm used, why, how the results are, etc.

## Result

<br>

### NDS (Normalize Data Store):

<br>

![NDS](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641901331/side-project/Data%20Warehouse%20-%20UKAccident/nds.png)

### DDS (Dimensional Data Store):

<br>

![DDS Accident](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641901330/side-project/Data%20Warehouse%20-%20UKAccident/dds-1.png)
![DDS Casualty](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641901330/side-project/Data%20Warehouse%20-%20UKAccident/dds-2.png)
![DDS Vehicle](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641901330/side-project/Data%20Warehouse%20-%20UKAccident/dds-3.png)

### OLAP (Online Analytical Processing):

<br>

![OLAP](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641901332/side-project/Data%20Warehouse%20-%20UKAccident/olap-1.png)
![OLAP](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641901332/side-project/Data%20Warehouse%20-%20UKAccident/olap-2.png)
![OLAP](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641901332/side-project/Data%20Warehouse%20-%20UKAccident/olap-3.png)

<br>

### MDX:

<br>

![MDX](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641901330/side-project/Data%20Warehouse%20-%20UKAccident/mdx-1.png)

<br>

### Data Visualization:

<br>

![Visualization](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641891284/side-project/Data%20Warehouse%20-%20UKAccident/visualization/v_Cau01.png)
![Visualization](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641891284/side-project/Data%20Warehouse%20-%20UKAccident/visualization/v_Cau02.png)
![Visualization](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641891284/side-project/Data%20Warehouse%20-%20UKAccident/visualization/v_Cau03.png)
![Visualization](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641891284/side-project/Data%20Warehouse%20-%20UKAccident/visualization/v_Cau04.png)
![Visualization](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641891284/side-project/Data%20Warehouse%20-%20UKAccident/visualization/v_Cau05.png)
![Visualization](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641891284/side-project/Data%20Warehouse%20-%20UKAccident/visualization/v_Cau06.png)
![Visualization](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641891284/side-project/Data%20Warehouse%20-%20UKAccident/visualization/v_Cau07.png)
![Visualization](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641891284/side-project/Data%20Warehouse%20-%20UKAccident/visualization/v_Cau09.png)
![Visualization](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641891284/side-project/Data%20Warehouse%20-%20UKAccident/visualization/v_Cau11.png)
![Visualization](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641891284/side-project/Data%20Warehouse%20-%20UKAccident/visualization/v_Cau13.png)

<br>

### Data Mining:

<br>

![Data Mining](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641901331/side-project/Data%20Warehouse%20-%20UKAccident/mining.png)
![Data Mining](https://res.cloudinary.com/tuan-cloudinary/image/upload/v1641901331/side-project/Data%20Warehouse%20-%20UKAccident/mining-2.png)
