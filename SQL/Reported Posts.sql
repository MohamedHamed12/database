SELECT
    a.extra AS report_reason,
    COUNT(DISTINCT (a.post_id)) AS report_count
FROM
    ACTION
WHERE
    action = 'report'
    AND action_date = '2019-07-04'
GROUP BY
    a.extra
ORDER BY
    a.report_reason