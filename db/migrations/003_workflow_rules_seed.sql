-- workflow sets grouped by workflow Id

BEGIN;

INSERT INTO workflows (name, description)
VALUES ('Job Search Labler', 'Determines if email needs a jobs label')
ON CONFLICT (id) DO NOTHING;

INSERT INTO workflow_triggers (workflow_id, trigger_type, conditions)
VALUES (
    1,
    'subjectorsnippet_contains_any',
    '{"keywords": ["interview", "recruiter", "application", "recruiting", "opportunity"]}'::jsonb
)
ON CONFLICT DO NOTHING;

INSERT INTO workflow_actions (workflow_id, action_type, action_config, execution_order)
VALUES (1, 'insert_label', '{"label": "Jobs"}', 0)
ON CONFLICT DO NOTHING;

COMMIT;