SELECT
    v.id,
    v.post_id,
    v.vote_type_id,
    vt.vote_type,
    COALESCE(v.creation_date, '1900-01-01') AS creation_date
FROM {{ ref('votes') }} AS v
LEFT JOIN {{ ref('vote_type_mapping') }} AS vt
    ON v.vote_type_id = vt.vote_type_id
