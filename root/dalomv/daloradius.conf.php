<?php
/*
 *********************************************************************************************************
 * daloRADIUS - RADIUS Web Platform
 * Copyright (C) 2007 - Liran Tal <liran@enginx.com> All Rights Reserved.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *
 *********************************************************************************************************
 * Description:
 *              daloRADIUS Configuration File
 *
 * Modification Date:
 *              Sun Jan 22 16:01:28 UTC 2023
 *********************************************************************************************************
 */


$configValues['DALORADIUS_VERSION'] = '1.3';
$configValues['DALORADIUS_DATE'] = '04 Nov 2021';
$configValues['FREERADIUS_VERSION'] = '2';
$configValues['CONFIG_DB_ENGINE'] = 'mysqli';
$configValues['CONFIG_DB_HOST'] = 'localhost';
$configValues['CONFIG_DB_PORT'] = '3306';
$configValues['CONFIG_DB_USER'] = 'radius';
$configValues['CONFIG_DB_PASS'] = 'Passw@rd';
$configValues['CONFIG_DB_NAME'] = 'radius';
$configValues['CONFIG_DB_TBL_RADCHECK'] = 'radcheck';
$configValues['CONFIG_DB_TBL_RADREPLY'] = 'radreply';
$configValues['CONFIG_DB_TBL_RADGROUPREPLY'] = 'radgroupreply';
$configValues['CONFIG_DB_TBL_RADGROUPCHECK'] = 'radgroupcheck';
$configValues['CONFIG_DB_TBL_RADUSERGROUP'] = 'radusergroup';
$configValues['CONFIG_DB_TBL_RADNAS'] = 'nas';
$configValues['CONFIG_DB_TBL_RADHG'] = 'radhuntgroup';
$configValues['CONFIG_DB_TBL_RADPOSTAUTH'] = 'radpostauth';
$configValues['CONFIG_DB_TBL_RADACCT'] = 'radacct';
$configValues['CONFIG_DB_TBL_RADIPPOOL'] = 'radippool';
$configValues['CONFIG_DB_TBL_DALOOPERATORS'] = 'operators';
$configValues['CONFIG_DB_TBL_DALOOPERATORS_ACL'] = 'operators_acl';
$configValues['CONFIG_DB_TBL_DALOOPERATORS_ACL_FILES'] = 'operators_acl_files';
$configValues['CONFIG_DB_TBL_DALORATES'] = 'rates';
$configValues['CONFIG_DB_TBL_DALOHOTSPOTS'] = 'hotspots';
$configValues['CONFIG_DB_TBL_DALOUSERINFO'] = 'userinfo';
$configValues['CONFIG_DB_TBL_DALOUSERBILLINFO'] = 'userbillinfo';
$configValues['CONFIG_DB_TBL_DALODICTIONARY'] = 'dictionary';
$configValues['CONFIG_DB_TBL_DALOREALMS'] = 'realms';
$configValues['CONFIG_DB_TBL_DALOPROXYS'] = 'proxys';
$configValues['CONFIG_DB_TBL_DALOBILLINGPAYPAL'] = 'billing_paypal';
$configValues['CONFIG_DB_TBL_DALOBILLINGMERCHANT'] = 'billing_merchant';
$configValues['CONFIG_DB_TBL_DALOBILLINGPLANS'] = 'billing_plans';
$configValues['CONFIG_DB_TBL_DALOBILLINGRATES'] = 'billing_rates';
$configValues['CONFIG_DB_TBL_DALOBILLINGHISTORY'] = 'billing_history';
$configValues['CONFIG_DB_TBL_DALOBATCHHISTORY'] = 'batch_history';
$configValues['CONFIG_DB_TBL_DALOBILLINGPLANSPROFILES'] = 'billing_plans_profiles';
$configValues['CONFIG_DB_TBL_DALOBILLINGINVOICE'] = 'invoice';
$configValues['CONFIG_DB_TBL_DALOBILLINGINVOICEITEMS'] = 'invoice_items';
$configValues['CONFIG_DB_TBL_DALOBILLINGINVOICESTATUS'] = 'invoice_status';
$configValues['CONFIG_DB_TBL_DALOBILLINGINVOICETYPE'] = 'invoice_type';
$configValues['CONFIG_DB_TBL_DALOPAYMENTS'] = 'payment';
$configValues['CONFIG_DB_TBL_DALOPAYMENTTYPES'] = 'payment_type';
$configValues['CONFIG_DB_TBL_DALONODE'] = 'node';
$configValues['CONFIG_FILE_RADIUS_PROXY'] = '/etc/freeradius/proxy.conf';
$configValues['CONFIG_PATH_RADIUS_DICT'] = '';
$configValues['CONFIG_PATH_DALO_VARIABLE_DATA'] = '/var/www/daloradius/var';
$configValues['CONFIG_DB_PASSWORD_ENCRYPTION'] = 'cleartext';
$configValues['CONFIG_LANG'] = 'en';
$configValues['CONFIG_LOG_PAGES'] = 'yes';
$configValues['CONFIG_LOG_ACTIONS'] = 'yes';
$configValues['CONFIG_LOG_QUERIES'] = 'yes';
$configValues['CONFIG_DEBUG_SQL'] = 'yes';
$configValues['CONFIG_DEBUG_SQL_ONPAGE'] = 'yes';
$configValues['CONFIG_LOG_FILE'] = '/tmp/daloradius.log';
$configValues['CONFIG_IFACE_PASSWORD_HIDDEN'] = 'no';
$configValues['CONFIG_IFACE_TABLES_LISTING'] = '25';
$configValues['CONFIG_IFACE_TABLES_LISTING_NUM'] = 'yes';
$configValues['CONFIG_IFACE_AUTO_COMPLETE'] = 'yes';
$configValues['CONFIG_MAINT_TEST_USER_RADIUSSERVER'] = '127.0.0.1';
$configValues['CONFIG_MAINT_TEST_USER_RADIUSPORT'] = '1812';
$configValues['CONFIG_MAINT_TEST_USER_NASPORT'] = '0';
$configValues['CONFIG_MAINT_TEST_USER_RADIUSSECRET'] = 'testing123';
$configValues['CONFIG_USER_ALLOWEDRANDOMCHARS'] = 'ACDEFHJKMNPQRTUWXY23456789';
$configValues['CONFIG_PASSW_ALLOWEDRANDOMCHARS'] = 'ACEFHKMNPRTWXY23459';
$configValues['CONFIG_MAIL_SMTPADDR'] = '127.0.0.1';
$configValues['CONFIG_MAIL_SMTPPORT'] = '25';
$configValues['CONFIG_MAIL_SMTPAUTH'] = '';
$configValues['CONFIG_MAIL_SMTPFROM'] = 'root@daloradius.xdsl.by';
$configValues['CONFIG_DASHBOARD_DALO_SECRETKEY'] = 'sillykey';
$configValues['CONFIG_DASHBOARD_DALO_DEBUG'] = '1';
$configValues['CONFIG_DASHBOARD_DALO_DELAYSOFT'] = '5';
$configValues['CONFIG_DASHBOARD_DALO_DELAYHARD'] = '15';
$configValues['CONFIG_INVOICE_TEMPLATE'] = 'invoice_template.html';
$configValues['CONFIG_INVOICE_ITEM_TEMPLATE'] = 'invoice_item_template.html';


?>
