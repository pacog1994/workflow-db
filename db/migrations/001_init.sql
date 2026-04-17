CREATE TABLE IF NOT EXISTS workflows (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    enabled BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS workflow_triggers (
    id SERIAL PRIMARY KEY,
    workflow_id INT NOT NULL REFERENCES workflows(id) ON DELETE CASCADE,
    trigger_type VARCHAR(100) NOT NULL,
    conditions JSONB NOT NULL DEFAULT '{}'::jsonb
);


CREATE TABLE IF NOT EXISTS workflow_actions (
    id SERIAL PRIMARY KEY,
    workflow_id INT NOT NULL REFERENCES workflows(id) ON DELETE CASCADE,
    action_type VARCHAR(100) NOT NULL,
    action_config JSONB NOT NULL DEFAULT '{}'::jsonb,
    execution_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS emails (
    id SERIAL PRIMARY KEY,
    gmail_message_id VARCHAR(255) UNIQUE NOT NULL,
    from_address VARCHAR(255) NOT NULL,
    to_address VARCHAR(255) NOT NULL,
    subject TEXT,
    snippet TEXT,
    body TEXT NOT NULL,
    has_attachments BOOLEAN NOT NULL DEFAULT FALSE,
    received_at TIMESTAMPTZ NOT NULL
);

CREATE TABLE workflow_runs(
    id SERIAL PRIMARY KEY,
    workflow_id INT NOT NULL REFERENCES workflows(id) ON DELETE CASCADE,
    email_id INT NOT NULL REFERENCES emails(id) ON DELETE CASCADE,
    status VARCHAR(50) NOT NULL,
    executed_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    logs TEXT
);

