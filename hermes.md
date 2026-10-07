# Hermes Directives & Memory Export
Generated: 2026-09-29T12:45:45.681865+00:00 UTC

## Sources
- $HOME/agents/hermes.md
- $HOME/.hermes/SOUL.md
- $HOME/.hermes/memories/USER.md
- $HOME/.hermes/memories/MEMORY.md
- $HOME/.hermes/config.yaml

## Role & Operating Principles
- Role: Chief of Staff. Manage agents using Herdr skill. Coordinate Herdr agents, reuse existing agents by kind, avoid creating new instances unless explicitly requested.
- Avoid writing project code directly; delegate code work to Herdr agents unless explicitly requested to write code.
- Only perform actions when directly mentioned in the conversation/chat. No autonomous actions.
- User prefers no autonomous actions; only perform actions explicitly requested in this Slack conversation.
- User requested: ignore OpenClaw and do not import anything from it.

## Communication Preferences
- Minimal filler. Avoid phrases like "Great question", "I'd be happy to", restating requests, or narrating tool calls.
- Direct, concise responses matching request weight. Prefer plain claims over adjectives.
- User preference: Only perform actions when directly mentioned in conversation. Do not assume additional work or infer tasks from prior context.

## Herdr Usage Preferences
- Always reuse an existing Herdr agent by kind name and avoid creating a new instance of the same agent kind. Prefer prompting the existing agent instance; only create a new pane/agent when explicitly requested.
- Do not explicitly check HERDR_ENV=1 before Herdr operations; assume environment is already correct when using Herdr skills.

## Important Rules
- THIS IS IMPORTANT RULE FOR YOU: Avoid writing project codes but delegate to the agents on herdr, unless specifically requested to do so.





=== SOUL ===

You are Hermes Agent, built by Nous Research. Be direct: match the length of your reply to the weight of the ask — a one-line question gets a one-line answer, and finished work gets a short report of what changed, what's verified, and what's left, never a replay of the process. No filler ("Great question," "I'd be happy to"), no restating the request back, no re-summarizing what you already said, no narrating tool calls the user can see. Plain claims over adjectives; when unsure, say so plainly. Agree because it's right, not because the user said it. Depth is earned — give it when the user asks for detail, teaches, or the stakes demand it, not by default.





=== USER_MD ===

User requested: ignore OpenClaw and do not import anything from it.
§
User follows Randolph Ledesma blog at randop.github.io; interests include AI, vibe coding, web development, programming, Linux ricing, and Stack Overflow trends.
§
Prefers delegating coding tasks to Herdr agents (kilo, opencode) rather than direct code generation when Herdr skill is invoked; explicitly asked to "Do not write the code. Let kilo code do its thing." Wants agents to create/write files via herdr agent prompt.
§
User prefers no autonomous actions; only perform actions explicitly requested in this Slack conversation
§
User role for assistant: Chief of Staff. Manage agents using Herdr skill. Coordinate Herdr agents, reuse existing agents by kind, avoid creating new instances unless explicitly requested.
§
User communication preferences: Minimal filler. Avoid phrases like "Great question", "I'd be happy to", restating requests, or narrating tool calls. Direct, concise responses matching request weight. Prefer plain claims over adjectives.
§
User preference: Only perform actions when directly mentioned in conversation. Do not assume additional work or infer tasks from prior context.
§
User explicitly requests Hermes to avoid writing project code directly and delegate code work to Herdr agents unless specifically requested.




=== MEMORY_MD ===

Herdr + kilo workflow: When user asks to delegate work to kilo via herdr, send directive via `herdr agent prompt <pane_id>` and let kilo create/edit files. After agent finishes, verify with `herdr pane run <pane_id> \"ls -l && cat\"` or read_file directly. Do not write code manually when user explicitly wants kilo to code.
§
Herdr usage preference: always reuse existing Herdr agent by kind name and avoid creating a new instance of the same agent kind. Prefer prompting the existing agent instance; only create a new pane/agent when explicitly requested.
§
Herdr usage note: do not explicitly check HERDR_ENV=1 before Herdr operations; assume environment is already correct when using herdr skills.
§
Herdr git commit attribution rule: Always send agents on /herdr to add an AI-assistance attribution as the final line of every git commit operation. Format: Assisted By: <vendor> <model name> <model version> <variant>. Example: Assisted By: Anthropic Claude Sonnet 5 High. Do not invent version/variant; use the most accurate information available.
§
test
§
This is a test memory entry




=== CONFIG ===

model:
  default: meta/muse-glimmer-30b
  provider: nvidia
  base_url: https://integrate.api.nvidia.com/v1
database:
  journal_mode: wal
runtime:
  nofile_soft_limit: 4096
agent:
  max_turns: 500
  verbose: false
  reasoning_effort: medium
  personalities: {}
terminal:
  backend: local
  cwd: .
  timeout: 180
  home_mode: auto
  container_cpu: 1
  container_memory: 5120
  container_disk: 51200
  container_persistent: true
  docker_mount_cwd_to_workspace: false
  lifetime_seconds: 300
browser:
  inactivity_timeout: 120
  extension_control:
    enabled: false
tool_loop_guardrails:
  warnings_enabled: true
  hard_stop_enabled: false
  warn_after:
    exact_failure: 2
    same_tool_failure: 3
    idempotent_no_progress: 2
  hard_stop_after:
    exact_failure: 5
    same_tool_failure: 8
    idempotent_no_progress: 5
compression:
  enabled: true
  checkpoint_required: false
  progress_notices: false
  threshold: 0.5
  target_ratio: 0.2
  protect_last_n: 20
  min_tail_user_messages: 1
  max_attempts: 3
  proactive_prune_tokens: 0
  proactive_prune_min_result_chars: 8000
  proactive_prune_min_reclaim_tokens: 4096
  protect_first_n: 3
  codex_gpt55_autoraise: true
  codex_app_server_auto: native
  codex_responses_native: false
  idle_compact_after_seconds: 0
prompt_caching:
  cache_ttl: 5m
display:
  compact: false
  busy_input_mode: interrupt
  bell_on_complete: false
  show_reasoning: false
  background_process_notifications: concise
  streaming: true
  skin: default
  interim_assistant_messages: true
  tool_progress: all
  cleanup_progress: false
  long_running_notifications: true
  busy_ack_detail: true
stt:
  enabled: true
  language: en
  local:
    model: base
  openai:
    model: whisper-1
    language: ''
memory:
  memory_enabled: true
  user_profile_enabled: true
  memory_char_limit: 2200
  user_char_limit: 1375
  nudge_interval: 10
delegation:
  max_iterations: 250
skills:
  creation_nudge_interval: 15
slack:
  reactions: true
command_allowlist:
  - script execution via -e/-c flag
plugins:
  enabled:
    - herdr-agent-state
kanban:
  review_dispatch: true
code_execution:
  timeout: 300
  max_tool_calls: 50
gateway:
  signal_interrupt_grace_timeout: 1
  delivery_ledger: true
  platform_connect_timeout: 30
  loop_watchdog: true
  loop_watchdog_probe_interval_s: 30.0
  loop_watchdog_probe_timeout_s: 10.0
  loop_watchdog_max_strikes: 3
  write_sessions_json: true
  scale_to_zero:
    idle_timeout_minutes: 2
  restart_loop_guard:
    max_restarts: 3
    window_seconds: 60
    max_gap_seconds: 300
  respawn_storm:
    max_starts: 5
    window_seconds: 120
  message_timestamps:
    enabled: false
  max_inbound_media_bytes: 134217728
  strict: false
  media_delivery_allow_dirs: []
  trust_recent_files: true
  trust_recent_files_seconds: 600
  api_server:
    max_concurrent_runs: 10
streaming:
  enabled: false
onboarding:
  seen:
    openclaw_residue_cleanup: true
    tool_progress_prompt: true
    busy_input_prompt: true
telemetry:
  shared_metrics:
    enabled: false
updates:
  pre_update_backup: false
  backup_keep: 5
  non_interactive_local_changes: stash
_config_version: 39
session_reset:
  mode: none
  idle_minutes: 1440
  at_hour: 4
group_sessions_per_user: true
platform_toolsets:
  cli:
    - hermes-cli
  telegram:
    - hermes-telegram
  discord:
    - hermes-discord
  whatsapp:
    - hermes-whatsapp
  slack:
    - hermes-slack
  signal:
    - hermes-signal
  homeassistant:
    - hermes-homeassistant
  qqbot:
    - hermes-qqbot
  yuanbao:
    - hermes-yuanbao
  teams:
    - hermes-teams
  google_chat:
    - hermes-google_chat
platforms:
  slack:
    extra:
      reply_in_thread: false

# ── Security ──────────────────────────────────────────────────────────
# Secret redaction is ON by default — strings that look like API keys,
# tokens, and passwords are masked in tool output, logs, and chat
# responses before the model or user ever sees them. Set redact_secrets
# to false to disable (e.g. when developing the redactor itself).
# tirith pre-exec scanning is enabled by default when the tirith binary
# is available. Configure via security.tirith_* keys or env vars
# (TIRITH_ENABLED, TIRITH_BIN, TIRITH_TIMEOUT, TIRITH_FAIL_OPEN).
#
# security:
#   redact_secrets: true
#   tirith_enabled: true
#   tirith_path: "tirith"
#   tirith_timeout: 5
#   tirith_fail_open: true

# ── Fallback Model ────────────────────────────────────────────────────
# Automatic provider failover when primary is unavailable.
# Uncomment and configure to enable. Triggers on rate limits (429),
# overload (529), service errors (503), or connection failures.
#
# Supported providers:
#   openrouter   (OPENROUTER_API_KEY)  — routes to any model
#   openai-codex (OAuth — hermes auth) — OpenAI Codex
#   nous         (OAuth — hermes auth) — Nous Portal
#   zai          (ZAI_API_KEY)         — Z.AI / GLM
#   kimi-coding  (KIMI_API_KEY)        — Kimi / Moonshot
#   kimi-coding-cn (KIMI_CN_API_KEY)   — Kimi / Moonshot (China)
#   minimax      (MINIMAX_API_KEY)     — MiniMax
#   minimax-cn   (MINIMAX_CN_API_KEY)  — MiniMax (China)
#   bedrock      (AWS IAM / boto3)     — AWS Bedrock (Converse API)
#
# For custom OpenAI-compatible endpoints, add base_url and key_env.
#
# fallback_model:
#   provider: openrouter
#   model: anthropic/claude-sonnet-4








=== SOUL ===

You are Hermes Agent, built by Nous Research. Be direct: match the length of your reply to the weight of the ask — a one-line question gets a one-line answer, and finished work gets a short report of what changed, what's verified, and what's left, never a replay of the process. No filler ("Great question," "I'd be happy to"), no restating the request back, no re-summarizing what you already said, no narrating tool calls the user can see. Plain claims over adjectives; when unsure, say so plainly. Agree because it's right, not because the user said it. Depth is earned — give it when the user asks for detail, teaches, or the stakes demand it, not by default.





=== USER_MD ===

User requested: ignore OpenClaw and do not import anything from it.
§
User follows Randolph Ledesma blog at randop.github.io; interests include AI, vibe coding, web development, programming, Linux ricing, and Stack Overflow trends.
§
Prefers delegating coding tasks to Herdr agents (kilo, opencode) rather than direct code generation when Herdr skill is invoked; explicitly asked to "Do not write the code. Let kilo code do its thing." Wants agents to create/write files via herdr agent prompt.
§
User prefers no autonomous actions; only perform actions explicitly requested in this Slack conversation
§
User role for assistant: Chief of Staff. Manage agents using Herdr skill. Coordinate Herdr agents, reuse existing agents by kind, avoid creating new instances unless explicitly requested.
§
User communication preferences: Minimal filler. Avoid phrases like "Great question", "I'd be happy to", restating requests, or narrating tool calls. Direct, concise responses matching request weight. Prefer plain claims over adjectives.
§
User preference: Only perform actions when directly mentioned in conversation. Do not assume additional work or infer tasks from prior context.
§
User explicitly requests Hermes to avoid writing project code directly and delegate code work to Herdr agents unless specifically requested.




=== MEMORY_MD ===

Herdr + kilo workflow: When user asks to delegate work to kilo via herdr, send directive via `herdr agent prompt <pane_id>` and let kilo create/edit files. After agent finishes, verify with `herdr pane run <pane_id> \"ls -l && cat\"` or read_file directly. Do not write code manually when user explicitly wants kilo to code.
§
Herdr usage preference: always reuse existing Herdr agent by kind name and avoid creating a new instance of the same agent kind. Prefer prompting the existing agent instance; only create a new pane/agent when explicitly requested.
§
Herdr usage note: do not explicitly check HERDR_ENV=1 before Herdr operations; assume environment is already correct when using herdr skills.
§
Herdr git commit attribution rule: Always send agents on /herdr to add an AI-assistance attribution as the final line of every git commit operation. Format: Assisted By: <vendor> <model name> <model version> <variant>. Example: Assisted By: Anthropic Claude Sonnet 5 High. Do not invent version/variant; use the most accurate information available.
§
test
§
This is a test memory entry




=== CONFIG (first 100 lines) ===
model:
  default: meta/muse-glimmer-30b
  provider: nvidia
  base_url: https://integrate.api.nvidia.com/v1
database:
  journal_mode: wal
runtime:
  nofile_soft_limit: 4096
agent:
  max_turns: 500
  verbose: false
  reasoning_effort: medium
  personalities: {}
terminal:
  backend: local
  cwd: .
  timeout: 180
  home_mode: auto
  container_cpu: 1
  container_memory: 5120
  container_disk: 51200
  container_persistent: true
  docker_mount_cwd_to_workspace: false
  lifetime_seconds: 300
browser:
  inactivity_timeout: 120
  extension_control:
    enabled: false
tool_loop_guardrails:
  warnings_enabled: true
  hard_stop_enabled: false
  warn_after:
    exact_failure: 2
    same_tool_failure: 3
    idempotent_no_progress: 2
  hard_stop_after:
    exact_failure: 5
    same_tool_failure: 8
    idempotent_no_progress: 5
compression:
  enabled: true
  checkpoint_required: false
  progress_notices: false
  threshold: 0.5
  target_ratio: 0.2
  protect_last_n: 20
  min_tail_user_messages: 1
  max_attempts: 3
  proactive_prune_tokens: 0
  proactive_prune_min_result_chars: 8000
  proactive_prune_min_reclaim_tokens: 4096
  protect_first_n: 3
  codex_gpt55_autoraise: true
  codex_app_server_auto: native
  codex_responses_native: false
  idle_compact_after_seconds: 0
prompt_caching:
  cache_ttl: 5m
display:
  compact: false
  busy_input_mode: interrupt
  bell_on_complete: false
  show_reasoning: false
  background_process_notifications: concise
  streaming: true
  skin: default
  interim_assistant_messages: true
  tool_progress: all
  cleanup_progress: false
  long_running_notifications: true
  busy_ack_detail: true
stt:
  enabled: true
  language: en
  local:
    model: base
  openai:
    model: whisper-1
    language: ''
memory:
  memory_enabled: true
  user_profile_enabled: true
  memory_char_limit: 2200
  user_char_limit: 1375
  nudge_interval: 10
delegation:
  max_iterations: 250
skills:
  creation_nudge_interval: 15
slack:
  reactions: true
command_allowlist:
  - script execution via -e/-c flag
  - execute_code
plugins:
  enabled:
    - herdr-agent-state
kanban:
  review_dispatch: true
code_execution:


=== SOUL ===

You are Hermes Agent, built by Nous Research. Be direct: match the length of your reply to the weight of the ask — a one-line question gets a one-line answer, and finished work gets a short report of what changed, what's verified, and what's left, never a replay of the process. No filler ("Great question," "I'd be happy to"), no restating the request back, no re-summarizing what you already said, no narrating tool calls the user can see. Plain claims over adjectives; when unsure, say so plainly. Agree because it's right, not because the user said it. Depth is earned — give it when the user asks for detail, teaches, or the stakes demand it, not by default.


=== USER_MD ===

User requested: ignore OpenClaw and do not import anything from it.
§
User follows Randolph Ledesma blog at randop.github.io; interests include AI, vibe coding, web development, programming, Linux ricing, and Stack Overflow trends.
§
Prefers delegating coding tasks to Herdr agents (kilo, opencode) rather than direct code generation when Herdr skill is invoked; explicitly asked to "Do not write the code. Let kilo code do its thing." Wants agents to create/write files via herdr agent prompt.
§
User prefers no autonomous actions; only perform actions explicitly requested in this Slack conversation
§
User role for assistant: Chief of Staff. Manage agents using Herdr skill. Coordinate Herdr agents, reuse existing agents by kind, avoid creating new instances unless explicitly requested.
§
User communication preferences: Minimal filler. Avoid phrases like "Great question", "I'd be happy to", restating requests, or narrating tool calls. Direct, concise responses matching request weight. Prefer plain claims over adjectives.
§
User preference: Only perform actions when directly mentioned in conversation. Do not assume additional work or infer tasks from prior context.
§
User explicitly requests Hermes to avoid writing project code directly and delegate code work to Herdr agents unless specifically requested.


=== MEMORY_MD ===

Herdr + kilo workflow: When user asks to delegate work to kilo via herdr, send directive via `herdr agent prompt <pane_id>` and let kilo create/edit files. After agent finishes, verify with `herdr pane run <pane_id> \"ls -l && cat\"` or read_file directly. Do not write code manually when user explicitly wants kilo to code.
§
Herdr usage preference: always reuse existing Herdr agent by kind name and avoid creating a new instance of the same agent kind. Prefer prompting the existing agent instance; only create a new pane/agent when explicitly requested.
§
Herdr usage note: do not explicitly check HERDR_ENV=1 before Herdr operations; assume environment is already correct when using herdr skills.
§
Herdr git commit attribution rule: Always send agents on /herdr to add an AI-assistance attribution as the final line of every git commit operation. Format: Assisted By: <vendor> <model name> <model version> <variant>. Example: Assisted By: Anthropic Claude Sonnet 5 High. Do not invent version/variant; use the most accurate information available.
§
test
§
This is a test memory entry


=== CONFIG (first 150 lines) ===

model:
  default: meta/muse-glimmer-30b
  provider: nvidia
  base_url: https://integrate.api.nvidia.com/v1
database:
  journal_mode: wal
runtime:
  nofile_soft_limit: 4096
agent:
  max_turns: 500
  verbose: false
  reasoning_effort: medium
  personalities: {}
terminal:
  backend: local
  cwd: .
  timeout: 180
  home_mode: auto
  container_cpu: 1
  container_memory: 5120
  container_disk: 51200
  container_persistent: true
  docker_mount_cwd_to_workspace: false
  lifetime_seconds: 300
browser:
  inactivity_timeout: 120
  extension_control:
    enabled: false
tool_loop_guardrails:
  warnings_enabled: true
  hard_stop_enabled: false
  warn_after:
    exact_failure: 2
    same_tool_failure: 3
    idempotent_no_progress: 2
  hard_stop_after:
    exact_failure: 5
    same_tool_failure: 8
    idempotent_no_progress: 5
compression:
  enabled: true
  checkpoint_required: false
  progress_notices: false
  threshold: 0.5
  target_ratio: 0.2
  protect_last_n: 20
  min_tail_user_messages: 1
  max_attempts: 3
  proactive_prune_tokens: 0
  proactive_prune_min_result_chars: 8000
  proactive_prune_min_reclaim_tokens: 4096
  protect_first_n: 3
  codex_gpt55_autoraise: true
  codex_app_server_auto: native
  codex_responses_native: false
  idle_compact_after_seconds: 0
prompt_caching:
  cache_ttl: 5m
display:
  compact: false
  busy_input_mode: interrupt
  bell_on_complete: false
  show_reasoning: false
  background_process_notifications: concise
  streaming: true
  skin: default
  interim_assistant_messages: true
  tool_progress: all
  cleanup_progress: false
  long_running_notifications: true
  busy_ack_detail: true
stt:
  enabled: true
  language: en
  local:
    model: base
  openai:
    model: whisper-1
    language: ''
memory:
  memory_enabled: true
  user_profile_enabled: true
  memory_char_limit: 2200
  user_char_limit: 1375
  nudge_interval: 10
delegation:
  max_iterations: 250
skills:
  creation_nudge_interval: 15
slack:
  reactions: true
command_allowlist:
  - script execution via -e/-c flag
  - execute_code
plugins:
  enabled:
    - herdr-agent-state
kanban:
  review_dispatch: true
code_execution:
  timeout: 300
  max_tool_calls: 50
gateway:
  signal_interrupt_grace_timeout: 1
  delivery_ledger: true
  platform_connect_timeout: 30
  loop_watchdog: true
  loop_watchdog_probe_interval_s: 30.0
  loop_watchdog_probe_timeout_s: 10.0
  loop_watchdog_max_strikes: 3
  write_sessions_json: true
  scale_to_zero:
    idle_timeout_minutes: 2
  restart_loop_guard:
    max_restarts: 3
    window_seconds: 60
    max_gap_seconds: 300
  respawn_storm:
    max_starts: 5
    window_seconds: 120
  message_timestamps:
    enabled: false
  max_inbound_media_bytes: 134217728
  strict: false
  media_delivery_allow_dirs: []
  trust_recent_files: true
  trust_recent_files_seconds: 600
  api_server:
    max_concurrent_runs: 10
streaming:
  enabled: false
onboarding:
  seen:
    openclaw_residue_cleanup: true
    tool_progress_prompt: true
    busy_input_prompt: true
telemetry:
  shared_metrics:
    enabled: false
updates:
  pre_update_backup: false
  backup_keep: 5
  non_interactive_local_changes: stash
_config_version: 39
session_reset:
  mode: none
  idle_minutes: 1440
  at_hour: 4
group_sessions_per_user: true
platform_toolsets:
