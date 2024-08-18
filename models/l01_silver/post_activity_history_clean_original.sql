SELECT
    ph.id,
    ph.post_id,
    ph.post_history_type_id,
    ph.revision_guid,
    ph.user_id,
    COALESCE(m.activity_type, 'unknown') AS activity_type,
    COALESCE(m.grouped_activity_type, 'unknown') AS grouped_activity_type,
    COALESCE(ph.creation_date, '1900-01-01') AS creation_date,
    COALESCE(ph.text, 'unknown') AS "text", -- noqa: RF04,RF06
    COALESCE(ph.comment, 'unknown') AS "comment" -- noqa: RF04,RF06
FROM {{ ref('post_history') }} AS ph
LEFT JOIN {{ ref('post_history_type_mapping') }} AS m
    ON ph.post_history_type_id = m.post_history_type_id
