#!/bin/bash

# config

BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BIN_DIR/func.sh

PROJECT_DIR="$(greadlink -f $BIN_DIR/../)"
ADDONS_DIR="$PROJECT_DIR/addons" ; LOAD_DIR="$PROJECT_DIR/load"
ODOO_DIR="$PROJECT_DIR/odoo"
EE_DIR="$PROJECT_DIR/addons/ee" 
OCA_DIR="$PROJECT_DIR/addons/oca"

ADDONS=(
$ODOO_DIR/openerp/addons
$EE_DIR
$ODOO_DIR/addons
$OCA_DIR
$PROJECT_DIR/projects
$PROJECT_DIR/projects/supernova
$PROJECT_DIR/addons/Pentaho-reports-for-OpenERP/odoo_addon
)

# run

ADDONS_PATH=$(join_array 'ADDONS')
printf $ADDONS_PATH
$ODOO_DIR/openerp-server -c "$PROJECT_DIR/config/dev.conf" --addons-path="$ADDONS_PATH" $@
