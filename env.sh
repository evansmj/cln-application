SETUP=${1:-local}

export APP_BITCOIN_NETWORK="regtest"
export APP_CORE_LIGHTNING_BITCOIN_NETWORK="$APP_BITCOIN_NETWORK"
if [[ "$APP_BITCOIN_NETWORK" == "mainnet" ]]; then
	export APP_CORE_LIGHTNING_BITCOIN_NETWORK="bitcoin"
fi

export APP_CORE_LIGHTNING_PORT=2103
export APP_CORE_LIGHTNING_REST_HIDDEN_SERVICE="http://oqaer4kd7ufryngx6dsztovs4pnlmaouwmtkofjsd2m7pkq7qd.onion"
export APP_MODE="testing"
export APP_PROTOCOL="http"

if [[ "$SETUP" == "docker" ]]; then
    export DEVICE_DOMAIN_NAME="docker.local"
    export LOCAL_HOST="http://""$DEVICE_DOMAIN_NAME"
    export APP_BITCOIN_NODE_IP="170.21.22.2"
    export APP_CORE_LIGHTNING_DAEMON_IP="170.21.22.3"
    export APP_CORE_LIGHTNING_IP="170.21.22.5"
    export APP_CONFIG_DIR="/data/app"
    export APP_CORE_LIGHTNING_REST_CERT_DIR="/c-lightning-rest/certs"
    export APP_CORE_LIGHTNING_WEBSOCKET_PORT=2106
    export APP_BITCOIN_RPC_USER="user"
    export APP_BITCOIN_RPC_PASS="password"
    export APP_CORE_LIGHTNING_DAEMON_GRPC_PORT=2105
    export APP_CORE_LIGHTNING_REST_PORT=2104
    export SINGLE_SIGN_ON=true
    export CORE_LIGHTNING_PATH="/data/.lightning"
    export COMMANDO_CONFIG="/data/.lightning/.commando-env"
    echo "Docker Environment Variables Set"
else
    export DEVICE_DOMAIN_NAME="local.local"
    export LOCAL_HOST="http://""$DEVICE_DOMAIN_NAME"
    export APP_BITCOIN_NODE_IP="localhost"
    export APP_CORE_LIGHTNING_DAEMON_IP="localhost"
    export APP_CORE_LIGHTNING_IP="127.0.0.1"
    export APP_CONFIG_DIR="$PWD/data/app"
    export APP_CORE_LIGHTNING_REST_CERT_DIR="$PWD/data/c-lightning-rest/certs"
    export APP_CORE_LIGHTNING_WEBSOCKET_PORT=5001
    export APP_CORE_LIGHTNING_DAEMON_GRPC_PORT=5002
    export APP_CORE_LIGHTNING_REST_PORT=3001
    export SINGLE_SIGN_ON=false
    export CORE_LIGHTNING_PATH="/home/.lightning/l1-regtest"
    export COMMANDO_CONFIG="$PWD/.commando"
    echo "Local Environment Variables Set"
fi
