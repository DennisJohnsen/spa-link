#!/bin/sh

set -e

#Launch the bwa_mqtt_bridge 
/usr/local/bundle/bin/bwa_mqtt_bridge ${MQTT_URI} tcp://${BRIDGE_IP}:${BRIDGE_PORT}/