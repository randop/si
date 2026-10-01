#!/usr/bin/env bash
set -euo pipefail

# --- Defaults ---
API_BASE="https://inference-api.nousresearch.com/v1"
NOUS_MODEL="${NOUS_MODEL:-stealth/space-bunny-alpha}"
OUTPUT_FILE="hermes-models.json"
DO_CHAT=false
DO_LIST=true
CUSTOM_PROMPT=""
MAX_TOKENS=256

# --- Help ---
usage() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Options:
  -h, --help              Show this help message
  -m, --model MODEL       Model to use (default: \$NOUS_MODEL or stealth/space-bunny-alpha)
  -c, --chat              Run example chat completion
  -p, --prompt TEXT       Custom user prompt (implies --chat)
  -t, --max-tokens N      Max tokens for chat (default: 256)
  -l, --list              List available models (default: on)
  --no-list               Skip listing models
  -o, --output FILE       Output file for models list (default: hermes-models.json)

Environment:
  NOUS_API_KEY            Required API key
  NOUS_MODEL              Default model (overridden by -m/--model)
EOF
}

# --- Argument parsing ---
while [[ $# -gt 0 ]]; do
  case "$1" in
  -h | --help)
    usage
    exit 0
    ;;
  -m | --model)
    NOUS_MODEL="$2"
    shift 2
    ;;
  -c | --chat)
    DO_CHAT=true
    shift
    ;;
  -p | --prompt)
    CUSTOM_PROMPT="$2"
    DO_CHAT=true
    shift 2
    ;;
  -t | --max-tokens)
    MAX_TOKENS="$2"
    shift 2
    ;;
  -l | --list)
    DO_LIST=true
    shift
    ;;
  --no-list)
    DO_LIST=false
    shift
    ;;
  -o | --output)
    OUTPUT_FILE="$2"
    shift 2
    ;;
  *)
    echo "Unknown option: $1" >&2
    usage >&2
    exit 1
    ;;
  esac
done

# --- Pre-flight checks ---
if [[ -z "${NOUS_API_KEY:-}" ]]; then
  echo "Error: NOUS_API_KEY environment variable is not set." >&2
  exit 1
fi

if ! command -v jq &>/dev/null; then
  echo "Error: 'jq' is required but not installed." >&2
  exit 1
fi

AUTH_HEADER="Authorization: Bearer ${NOUS_API_KEY}"

# --- Chat completion ---
if [[ "$DO_CHAT" == true ]]; then
  PROMPT="${CUSTOM_PROMPT:-How much wood would a theoretical 80kg woodchuck chuck? Assume a competitive environment.}"

  echo "→ Running chat completion"
  echo "  Model : ${NOUS_MODEL}"
  echo "  Prompt: ${PROMPT}"
  echo

  curl -sS --request POST \
    --url "${API_BASE}/chat/completions" \
    --header "${AUTH_HEADER}" \
    --header "Content-Type: application/json" \
    --data "$(jq -n \
      --arg model "$NOUS_MODEL" \
      --arg prompt "$PROMPT" \
      --argjson max_tokens "$MAX_TOKENS" \
      '{
        model: $model,
        messages: [
          {role: "system", content: "You are a helpful assistant."},
          {role: "user", content: $prompt}
        ],
        max_tokens: $max_tokens
      }')" | jq .

  echo
fi

# --- List models ---
if [[ "$DO_LIST" == true ]]; then
  echo "→ Fetching available models..."
  curl -sSL --request GET \
    --url "${API_BASE}/models" \
    --header "${AUTH_HEADER}" |
    jq . |
    tee "${OUTPUT_FILE}"

  echo
  echo "✓ Models saved to ${OUTPUT_FILE}"
fi
