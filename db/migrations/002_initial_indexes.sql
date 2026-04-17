-- Quick lookups by enabled flag
CREATE INDEX IF NOT EXISTS idx_workflows_enabled ON workflows(enabled);

-- Trigger lookup by workflow
CREATE INDEX IF NOT EXISTS idx_triggers_workflow_id ON workflow_triggers(workflow_id);

-- Action lookup by workflow
CREATE INDEX IF NOT EXISTS idx_actions_workflow_id ON workflow_actions(workflow_id);

--Email lookup by gmail message id & received_at
CREATE INDEX IF NOT EXISTS idx_emails_gmail_id ON emails (gmail_message_id);
CREATE INDEX IF NOT EXISTS idx_emails_received_at ON emails(received_at);

-- Workflow runs lookup
CREATE INDEX IF NOT EXISTS idx_runs_workflow_id ON workflow_runs(workflow_id);
CREATE INDEX IF NOT EXISTS idx_runs_email_id ON workflow_runs(email_id);
CREATE INDEX IF NOT EXISTS idex_runs_status ON workflow_runs(status);

