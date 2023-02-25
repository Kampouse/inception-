<?php

define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'jemartel' );
define( 'DB_PASSWORD', 'mypassword' );
define( 'DB_HOST', 'wordpress' );
define( 'DB_CHARSET', 'utf8mb4' );
define( 'DB_COLLATE', '' );
define('AUTH_KEY',         'UEFHrv@4!hxGIF@p}76mlBic4@}C^AkKoux+ZgkxL:*9O:q};oh<kl#Q1eTt4Hq4');
define('SECURE_AUTH_KEY',  '#}ot!xYNL6OZ 2jA0|@bN,HE3Zvo?~l_{rYg@T+3CzJVD*Jn)m%}7<YSUZ}]RS,|');
define('LOGGED_IN_KEY',    '_sS/l^86SQbV_ e4J$LW1- @{VyXsXU!r+23^x]N,1jI}:DM2`y%ijZMYP/?P/48');
define('NONCE_KEY',        'U$aTSXv,ULiT]o>qqJ{DH=z@8=9E%S*zt.kzs2tvK 9Q/iwT<=v/nc NIs*^MLtQ');
define('AUTH_SALT',        'kckKUtZ?D7>m-v]QC(1LOqoTY)*>V]<lOr,NG{Yon v~=!S|SR%CrO|EWz-:V+SL');
define('SECURE_AUTH_SALT', 'AJ4+1 t@9be^0joo$|m|3!tzrv2.>QniRRaf*EIr4h0|?L!IQ|Wvu51^kZ7PMQl0');
define('LOGGED_IN_SALT',   'J$wD{{Q(>pMb*+i1f!c9N7j/%a%zZJU@~Du[#L[Fb-+_}Z ,q$$kPYh@eK9 V#4-');
define('NONCE_SALT',       'U-;ysL41%R|4fI% ?SnG6J:h I8[%|z4T{Iy|nA`_mf3U+>ocVFyb]XdH?-6[Itn');
$table_prefix = 'wp_';

define( 'WP_DEBUG', true );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

require_once( ABSPATH . 'wp-settings.php' );
 ?>