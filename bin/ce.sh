#!/bin/bash

# config

BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BIN_DIR/func.sh

PROJECT_DIR="$(greadlink -f $BIN_DIR/../)"
ADDONS_DIR="$PROJECT_DIR/addons" ; LOAD_DIR="$PROJECT_DIR/load"
ODOO_DIR="$PROJECT_DIR/odoo"
OCA_DIR="$PROJECT_DIR/addons/oca"

ADDONS=(
$ODOO_DIR/odoo/addons
$ODOO_DIR/addons
)

# run

ADDONS_PATH=$(join_array 'ADDONS')
$ODOO_DIR/odoo-bin -c "$PROJECT_DIR/config/dev.conf" --addons-path="$ADDONS_PATH" $@
