#!/bin/bash
set -eo pipefail

declare -x ELASTICSEARCH_BASE_DIR
[[ -z "${ELASTICSEARCH_BASE_DIR}" ]] && ELASTICSEARCH_BASE_DIR="/var/lib/elasticsearch"

declare -x ELASTICSEARCH_CONFIG_DIR
[[ -z "${ELASTICSEARCH_CONFIG_DIR}" ]] && ELASTICSEARCH_CONFIG_DIR="/etc/elasticsearch"

declare -x ELASTICSEARCH_DATA_DIR
[[ -z "${ELASTICSEARCH_DATA_DIR}" ]] && ELASTICSEARCH_DATA_DIR="${ELASTICSEARCH_BASE_DIR}/data"

declare -x ELASTICSEARCH_LOGS_DIR
[[ -z "${ELASTICSEARCH_LOGS_DIR}" ]] && ELASTICSEARCH_LOGS_DIR="${ELASTICSEARCH_BASE_DIR}/logs"

declare -x ELASTICSEARCH_PLUGINS_DIR
[[ -z "${ELASTICSEARCH_PLUGINS_DIR}" ]] && ELASTICSEARCH_PLUGINS_DIR="${ELASTICSEARCH_BASE_DIR}/plugins"

declare -x ELASTICSEARCH_SCRIPTS_DIR
[[ -z "${ELASTICSEARCH_SCRIPTS_DIR}" ]] && ELASTICSEARCH_SCRIPTS_DIR="${ELASTICSEARCH_BASE_DIR}/scripts"

declare -x ELASTICSEARCH_WORK_DIR
[[ -z "${ELASTICSEARCH_WORK_DIR}" ]] && ELASTICSEARCH_WORK_DIR="${ELASTICSEARCH_BASE_DIR}/work"

declare -x ELASTICSEARCH_CLUSTER_NAME
[[ -z "${ELASTICSEARCH_CLUSTER_NAME}" ]] && ELASTICSEARCH_CLUSTER_NAME="elasticsearch"

declare -x ELASTICSEARCH_NODE_NAME
[[ -z "${ELASTICSEARCH_NODE_NAME}" ]] && ELASTICSEARCH_NODE_NAME="${HOSTNAME}"

declare -x ELASTICSEARCH_NODE_MASTER
[[ -z "${ELASTICSEARCH_NODE_MASTER}" ]] && ELASTICSEARCH_NODE_MASTER="true"

declare -x ELASTICSEARCH_NODE_DATA
[[ -z "${ELASTICSEARCH_NODE_DATA}" ]] && ELASTICSEARCH_NODE_DATA="true"

declare -x ELASTICSEARCH_NODE_INGEST
[[ -z "${ELASTICSEARCH_NODE_INGEST}" ]] && ELASTICSEARCH_NODE_INGEST="true"

declare -x ELASTICSEARCH_MAX_LOCAL_STORAGE_NODES
[[ -z "${ELASTICSEARCH_MAX_LOCAL_STORAGE_NODES}" ]] && ELASTICSEARCH_MAX_LOCAL_STORAGE_NODES="1"

declare -x ELASTICSEARCH_NETWORK_HOST
[[ -z "${ELASTICSEARCH_NETWORK_HOST}" ]] && ELASTICSEARCH_NETWORK_HOST="0.0.0.0"

declare -x ELASTICSEARCH_NETWORK_PUBLISH_HOST
[[ -z "${ELASTICSEARCH_NETWORK_PUBLISH_HOST}" ]] && ELASTICSEARCH_NETWORK_PUBLISH_HOST=""

declare -x ELASTICSEARCH_BOOTSTRAP_MEMORY_LOCK
[[ -z "${ELASTICSEARCH_BOOTSTRAP_MEMORY_LOCK}" ]] && ELASTICSEARCH_BOOTSTRAP_MEMORY_LOCK="false"

declare -x ELASTICSEARCH_DISCOVERY_MINIMUM_MASTERS
[[ -z "${ELASTICSEARCH_DISCOVERY_MINIMUM_MASTERS}" ]] && ELASTICSEARCH_DISCOVERY_MINIMUM_MASTERS="1"

declare -x ELASTICSEARCH_DISCOVERY_UNICAST_HOSTS
[[ -z "${ELASTICSEARCH_DISCOVERY_UNICAST_HOSTS}" ]] && ELASTICSEARCH_DISCOVERY_UNICAST_HOSTS=""

declare -x ELASTICSEARCH_GATEWAY_RECOVER_AFTER_NODES
[[ -z "${ELASTICSEARCH_GATEWAY_RECOVER_AFTER_NODES}" ]] && ELASTICSEARCH_GATEWAY_RECOVER_AFTER_NODES="1"

declare -x ELASTICSEARCH_ACTION_DESTRUCTIVE_REQUIRES_NAME
[[ -z "${ELASTICSEARCH_ACTION_DESTRUCTIVE_REQUIRES_NAME}" ]] && ELASTICSEARCH_ACTION_DESTRUCTIVE_REQUIRES_NAME="false"

declare -x ELASTICSEARCH_HTTP_ENABLED
[[ -z "${ELASTICSEARCH_HTTP_ENABLED}" ]] && ELASTICSEARCH_HTTP_ENABLED="true"

declare -x ELASTICSEARCH_HTTP_COMPRESSION
[[ -z "${ELASTICSEARCH_HTTP_COMPRESSION}" ]] && ELASTICSEARCH_HTTP_COMPRESSION="true"

declare -x ELASTICSEARCH_HTTP_CORS_ENABLED
[[ -z "${ELASTICSEARCH_HTTP_CORS_ENABLED}" ]] && ELASTICSEARCH_HTTP_CORS_ENABLED="false"

declare -x ELASTICSEARCH_HTTP_CORS_ALLOW_ORIGIN
[[ -z "${ELASTICSEARCH_HTTP_CORS_ALLOW_ORIGIN}" ]] && ELASTICSEARCH_HTTP_CORS_ALLOW_ORIGIN=""

declare -x ELASTICSEARCH_INITIAL_HEAP
[[ -z "${ELASTICSEARCH_INITIAL_HEAP}" ]] && ELASTICSEARCH_INITIAL_HEAP="256m"

declare -x ELASTICSEARCH_MAXIMUM_HEAP
[[ -z "${ELASTICSEARCH_MAXIMUM_HEAP}" ]] && ELASTICSEARCH_MAXIMUM_HEAP="256m"

declare -x ELASTICSEARCH_STACK_SIZE
[[ -z "${ELASTICSEARCH_STACK_SIZE}" ]] && ELASTICSEARCH_STACK_SIZE="1m"

declare -x ELASTICSEARCH_MAX_MAP_COUNT
[[ -z "${ELASTICSEARCH_MAX_MAP_COUNT}" ]] && ELASTICSEARCH_MAX_MAP_COUNT=""

declare -x ELASTICSEARCH_MAX_FD
[[ -z "${ELASTICSEARCH_MAX_FD}" ]] && ELASTICSEARCH_MAX_FD="65536"

declare -x ELASTICSEARCH_XPACK_SECURITY_ENABLED
[[ -z "${ELASTICSEARCH_XPACK_SECURITY_ENABLED}" ]] && ELASTICSEARCH_XPACK_SECURITY_ENABLED="true"

export ELASTICSEARCH_JAVA_OPTIONS="-Xms${ELASTICSEARCH_INITIAL_HEAP} -Xmx${ELASTICSEARCH_MAXIMUM_HEAP} -Xss${ELASTICSEARCH_STACK_SIZE}"

export ES_PATH_CONF="/etc/elasticsearch"
export ES_JVM_OPTIONS="/etc/elasticsearch/jvm.options"
export ES_JAVA_OPTS="-Des.path.home=/usr/share/elasticsearch -Des.path.plugins=${ELASTICSEARCH_PLUGINS_DIR} -Des.path.script=${ELASTICSEARCH_SCRIPTS_DIR} -Des.path.work=${ELASTICSEARCH_WORK_DIR} -Des.scripting.exception_for_missing_value=true ${ELASTICSEARCH_JAVA_OPTIONS}"
