export APP_ID="core-lightning"
export APP_BITCOIN_NETWORK="regtest"
export APP_BITCOIN_RPC_USER="umbrel"
export APP_BITCOIN_RPC_PASS="moneyprintergobrrr"
export APP_BITCOIN_NODE_IP="172.23.0.2"

export TOR_PROXY_IP=""
export TOR_PROXY_PORT=""
export TOR_PASSWORD=""

export APP_CORE_LIGHTNING_IP="172.23.0.4"
export APP_CORE_LIGHTNING_PORT="2103"
export APP_CORE_LIGHTNING_DAEMON_IP="172.23.0.3"
export APP_CORE_LIGHTNING_DAEMON_GRPC_PORT=5010

export APP_CORE_LIGHTNING_TOR_HOST="tor.host"
export LIGHTNING_REST_PORT=3001
export LIGHTNING_REST_HIDDEN_SERVICE=""
export LIGHTNING_REST_MACAROON_PATH="/data/c-lightning-rest/certs"
export LOCAL_HOST="umbrel.local"
export CA_CERT=""
export CLIENT_KEY=""
export CLIENT_CERT=""

export APP_CORE_LIGHTNING_BITCOIN_NETWORK="${APP_BITCOIN_NETWORK}"
export APP_DATA_DIR="../../../.."
export APP_CORE_LIGHTNING_APPLICATION_MODE="development"
export APP_CORE_LIGHTNING_DAEMON_IP="localhost"

export APP_CORE_LIGHTNING_WS_PORT=5001
echo "Local Environment Variables Set"
