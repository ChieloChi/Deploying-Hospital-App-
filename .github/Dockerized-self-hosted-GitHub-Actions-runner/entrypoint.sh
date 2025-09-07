#!/bin/bash
set -e

# Check if all required env vars are set
if [[ -z "$REPO_URL" || -z "$RUNNER_TOKEN" ]]; then
  echo "ERROR: REPO_URL and RUNNER_TOKEN must be set."
  exit 1
fi

cd /home/runner

# Configure the runner
./config.sh \
  --url "$REPO_URL" \
  --token "$RUNNER_TOKEN" \
  --name "${RUNNER_NAME:-self-hosted-runner}" \
  --work "${RUNNER_WORKDIR:-_work}" \
  --unattended \
  --replace

# Run the GitHub Actions service
exec ./run.sh
