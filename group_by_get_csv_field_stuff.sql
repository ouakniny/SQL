SELECT ReportId, Email = 
    STUFF((SELECT ', ' + Email
           FROM your_table b 
           WHERE b.ReportId = a.ReportId 
          FOR XML PATH('')), 1, 2, '')
FROM your_table a
GROUP BY ReportId