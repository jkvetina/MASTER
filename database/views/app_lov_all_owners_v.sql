CREATE OR REPLACE FORCE VIEW app_lov_all_owners_v AS
WITH x AS (
    SELECT /*+ MATERIALIZE */
        '' AS prefix
    FROM DUAL
)
SELECT
    o.owner AS id,
    o.owner || NULLIF(' (' || COUNT(*) || ')', ' (0)') AS display_value,
    --
    o.owner || NULLIF(' (' || COUNT(CASE WHEN o.status = 'INVALID' THEN 1 END) || ')', ' (0)') AS display_value_alt,
    --
    o.owner AS sort#
    --
FROM all_objects o
CROSS JOIN x
WHERE o.owner LIKE x.prefix || '%'
GROUP BY
    o.owner;
/

