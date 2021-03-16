USE [DWH]
GO

/****** Object:  UserDefinedFunction [dbo].[UTF8_TO_NVARCHAR]    Script Date: 3/16/2021 9:54:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[UTF8_TO_NVARCHAR](@in VarChar(MAX))
   RETURNS NVarChar(MAX)
AS
BEGIN
   DECLARE @out NVarChar(MAX), @i int, @c int, @c2 int, @c3 int, @nc int

   SELECT @i = 1, @out = ''

   WHILE (@i <= Len(@in))
   BEGIN
      SET @c = Ascii(SubString(@in, @i, 1))

      IF (@c < 128)
      BEGIN
         SET @nc = @c
         SET @i = @i + 1
      END
      ELSE IF (@c > 191 AND @c < 224)
      BEGIN
         SET @c2 = Ascii(SubString(@in, @i + 1, 1))

         SET @nc = (((@c & 31) * 64 /* << 6 */) | (@c2 & 63))
         SET @i = @i + 2
      END
      ELSE
      BEGIN
         SET @c2 = Ascii(SubString(@in, @i + 1, 1))
         SET @c3 = Ascii(SubString(@in, @i + 2, 1))

         SET @nc = (((@c & 15) * 4096 /* << 12 */) | ((@c2 & 63) * 64 /* << 6 */) | (@c3 & 63))
         SET @i = @i + 3
      END

      SET @out = @out + NChar(@nc)
   END
   RETURN @out
END
GO


