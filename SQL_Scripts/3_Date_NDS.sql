---- Nhom TTKD12
-- Script to insert day, month, year table in the NDS database
----------------

GO
USE TTKD12_UKAccidents_NDS;
GO
​
-- insert Year
INSERT INTO dbo.Year (Year) VALUES (2011);
INSERT INTO dbo.Year (Year) VALUES (2012);
INSERT INTO dbo.Year (Year) VALUES (2013);
INSERT INTO dbo.Year (Year) VALUES (2014);
GO
​
-- insert Quarter
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(1, 1);
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(1, 2);
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(1, 3);
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(1, 4);
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(2, 1);
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(2, 2);
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(2, 3);
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(2, 4);
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(3, 1);
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(3, 2);
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(3, 3);
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(3, 4);
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(4, 1);
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(4, 2);
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(4, 3);
INSERT INTO dbo.Quarter (YearId, Quarter) VALUES(4, 4);
GO
​
-- insert MonthInQuarter
INSERT INTO dbo.Month(QuarterId, Month) VALUES(1, 1);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(1, 2);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(1, 3);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(2, 4);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(2, 5);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(2, 6);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(3, 7);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(3, 8);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(3, 9);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(4, 10);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(4, 11);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(4, 12);
​
INSERT INTO dbo.Month(QuarterId, Month) VALUES(5, 1);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(5, 2);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(5, 3);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(6, 4);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(6, 5);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(6, 6);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(7, 7);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(7, 8);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(7, 9);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(8, 10);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(8, 11);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(8, 12);
​
INSERT INTO dbo.Month(QuarterId, Month) VALUES(9, 1);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(9, 2);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(9, 3);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(10, 4);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(10, 5);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(10, 6);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(11, 7);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(11, 8);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(11, 9);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(12, 10);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(12, 11);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(12, 12);
​
INSERT INTO dbo.Month(QuarterId, Month) VALUES(13, 1);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(13, 2);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(13, 3);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(14, 4);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(14, 5);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(14, 6);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(15, 7);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(15, 8);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(15, 9);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(16, 10);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(16, 11);
INSERT INTO dbo.Month(QuarterId, Month) VALUES(16, 12);
GO


-- ***** insert Day *****
-- insert cac ngay trong thang co 31 ngay
CREATE PROCEDURE Month31Day @m31 int OUTPUT
AS
BEGIN
	DECLARE @d INT = 1;
	WHILE @d <= 31
	BEGIN
		INSERT INTO dbo.Day (MonthId, Day) VALUES (@m31, @d);
		SET @d = @d + 1;
	END;
END
GO
​
-- insert cac ngay trong thang co 30 ngay
CREATE PROCEDURE Month30Day @m30 int OUTPUT
AS
BEGIN
	DECLARE @d INT = 1;
	WHILE @d <= 30
	BEGIN
		INSERT INTO dbo.Day (MonthId, Day) VALUES (@m30, @d);
		SET @d = @d + 1;
	END;
END
GO
​
-- insert cac ngay trong thang co 29 ngay
CREATE PROCEDURE Month29Day @m29 int OUTPUT
AS
BEGIN
	DECLARE @d INT = 1;
	WHILE @d <= 29
	BEGIN
		INSERT INTO dbo.Day (MonthId, Day) VALUES (@m29, @d);
		SET @d = @d + 1;
	END;
END
GO
​
-- insert cac ngay trong thang co 28 ngay
CREATE PROCEDURE Month28Day @m28 int OUTPUT
AS
BEGIN
	DECLARE @d INT = 1;
	WHILE @d <= 28
	BEGIN
		INSERT INTO dbo.Day (MonthId, Day) VALUES (@m28, @d);
		SET @d = @d + 1;
	END;
END
GO

-- Nam 2011
EXEC Month31Day 1; -- thang 1 nam 2011
EXEC Month28Day 2; -- thang 2 nam 2011
EXEC Month31Day 3; -- thang 3 nam 2011
EXEC Month30Day 4; -- thang 4 nam 2011
EXEC Month31Day 5; -- thang 5 nam 2011
EXEC Month30Day 6; -- thang 6 nam 2011
EXEC Month31Day 7; -- thang 7 nam 2011
EXEC Month31Day 8; -- thang 8 nam 2011
EXEC Month30Day 9; -- thang 9 nam 2011
EXEC Month31Day 10; -- thang 10 nam 2011
EXEC Month30Day 11; -- thang 11 nam 2011
EXEC Month31Day 12; -- thang 12 nam 2011
​
-- Nam 2012
EXEC Month31Day 13; -- thang 1 nam 2012
EXEC Month29Day 14; -- thang 2 nam 2012
EXEC Month31Day 15; -- thang 3 nam 2012
EXEC Month30Day 16; -- thang 4 nam 2012
EXEC Month31Day 17; -- thang 5 nam 2012
EXEC Month30Day 18; -- thang 6 nam 2012
EXEC Month31Day 19; -- thang 7 nam 2012
EXEC Month31Day 20; -- thang 8 nam 2012
EXEC Month30Day 21; -- thang 9 nam 2012
EXEC Month31Day 22; -- thang 10 nam 2012
EXEC Month30Day 23; -- thang 11 nam 2012
EXEC Month31Day 24; -- thang 12 nam 2012
​
-- Nam 2013
EXEC Month31Day 25; -- thang 1 nam 2013
EXEC Month28Day 26; -- thang 2 nam 2013
EXEC Month31Day 27; -- thang 3 nam 2013
EXEC Month30Day 28; -- thang 4 nam 2013
EXEC Month31Day 29; -- thang 5 nam 2013
EXEC Month30Day 30; -- thang 6 nam 2013
EXEC Month31Day 31; -- thang 7 nam 2013
EXEC Month31Day 32; -- thang 8 nam 2013
EXEC Month30Day 33; -- thang 9 nam 2013
EXEC Month31Day 34; -- thang 10 nam 2013
EXEC Month30Day 35; -- thang 11 nam 2013
EXEC Month31Day 36; -- thang 12 nam 2013
​
-- Nam 2014
EXEC Month31Day 37; -- thang 1 nam 2014
EXEC Month28Day 38; -- thang 2 nam 2014
EXEC Month31Day 39; -- thang 3 nam 2014
EXEC Month30Day 40; -- thang 4 nam 2014
EXEC Month31Day 41; -- thang 5 nam 2014
EXEC Month30Day 42; -- thang 6 nam 2014
EXEC Month31Day 43; -- thang 7 nam 2014
EXEC Month31Day 44; -- thang 8 nam 2014
EXEC Month30Day 45; -- thang 9 nam 2014
EXEC Month31Day 46; -- thang 10 nam 2014
EXEC Month30Day 47; -- thang 11 nam 2014
EXEC Month31Day 48; -- thang 12 nam 2014
​
GO
