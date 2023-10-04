#!/command/with-contenv bashio
# shellcheck shell=bash

# Follow shellcheck recommendations
if bashio::config.has_value 'verbose'; then
    # bug in grott code, see: https://github.com/johanmeijer/grott/pull/304
    gverbose="$(bashio::config 'verbose')"
    verbose="$(bashio::config 'verbose')"
    export gverbose
    export verbose
fi
if bashio::config.has_value 'gminrecl'; then
    gminrecl="$(bashio::config 'gminrecl')"
    export gminrecl
fi
if bashio::config.has_value 'gmode'; then
    gmode="$(bashio::config 'gmode')"
    export gmode
fi
if bashio::config.has_value 'ggrottip'; then
    ggrottip="$(bashio::config 'ggrottip')"
    export ggrottip
fi
if bashio::config.has_value 'ggrottport'; then
    ggrottport="$(bashio::config 'ggrottport')"
    export ggrottport
fi
if bashio::config.has_value 'gblockcmd'; then
    gblockcmd="$(bashio::config 'gblockcmd')"
    export gblockcmd
fi
if bashio::config.has_value 'gnoipf'; then
    gnoipf="$(bashio::config 'gnoipf')"
    export gnoipf
fi
if bashio::config.has_value 'gtime'; then
    gtime="$(bashio::config 'gtime')"
    export gtime
fi
if bashio::config.has_value 'gtimezone'; then
    gtimezone="$(bashio::config 'gtimezone')"
    export gtimezone
fi
if bashio::config.has_value 'gsendbuf'; then
    gsendbuf="$(bashio::config 'gsendbuf')"
    export gsendbuf
fi
if bashio::config.has_value 'gcompat'; then
    gcompat="$(bashio::config 'gcompat')"
    export gcompat
fi
if bashio::config.has_value 'gvalueoffset'; then
    gvalueoffset="$(bashio::config 'gvalueoffset')"
    export gvalueoffset
fi
if bashio::config.has_value 'ginverterid'; then
    ginverterid="$(bashio::config 'ginverterid')"
    export ginverterid
fi
if bashio::config.has_value 'gincludeall'; then
    gincludeall="$(bashio::config 'gincludeall')"
    export gincludeall
fi
if bashio::config.has_value 'ginvtype'; then
    ginvtype="$(bashio::config 'ginvtype')"
    export ginvtype
fi
if bashio::config.has_value 'gdecrypt'; then
    gdecrypt="$(bashio::config 'gdecrypt')"
    export gdecrypt
fi
if bashio::config.has_value 'ggrowattip'; then
    ggrowattip="$(bashio::config 'ggrowattip')"
    export ggrowattip
fi
if bashio::config.has_value 'ggrowattport'; then
    ggrowattport="$(bashio::config 'ggrowattport')"
    export ggrowattport
fi
if bashio::config.has_value 'gmqttip'; then
    gmqttip="$(bashio::config 'gmqttip')"
    export gmqttip
fi
if bashio::config.has_value 'gmqttport'; then
    gmqttport="$(bashio::config 'gmqttport')"
    export gmqttport
fi
if bashio::config.has_value 'gmqtttopic'; then
    gmqtttopic="$(bashio::config 'gmqtttopic')"
    export gmqtttopic
fi
if bashio::config.has_value 'gmqttauth'; then
    gmqttauth="$(bashio::config 'gmqttauth')"
    export gmqttauth
fi
if bashio::config.has_value 'gmqttuser'; then
    gmqttuser="$(bashio::config 'gmqttuser')"
    export gmqttuser
fi
if bashio::config.has_value 'gmqttpassword'; then
    gmqttpassword="$(bashio::config 'gmqttpassword')"
    export gmqttpassword
fi
if bashio::config.has_value 'gpvoutput'; then
    gpvoutput="$(bashio::config 'gpvoutput')"
    export gpvoutput
fi
if bashio::config.has_value 'gpvapikey'; then
    gpvapikey="$(bashio::config 'gpvapikey')"
    export gpvapikey
fi
if bashio::config.has_value 'gpvsystemid'; then
    gpvsystemid="$(bashio::config 'gpvsystemid')"
    export gpvsystemid
fi
if bashio::config.has_value 'gpvinverters'; then
    gpvinverters="$(bashio::config 'gpvinverters')"
    export gpvinverters
fi
if bashio::config.has_value 'ginflux'; then
    ginflux="$(bashio::config 'ginflux')"
    export ginflux
fi
if bashio::config.has_value 'ginflux2'; then
    ginflux2="$(bashio::config 'ginflux2')"
    export ginflux2
fi
if bashio::config.has_value 'gifdbname'; then
    gifdbname="$(bashio::config 'gifdbname')"
    export gifdbname
fi
if bashio::config.has_value 'gifip'; then
    gifip="$(bashio::config 'gifip')"
    export gifip
fi
if bashio::config.has_value 'gifport'; then
    gifport="$(bashio::config 'gifport')"
    export gifport
fi
if bashio::config.has_value 'gifuser'; then
    gifuser="$(bashio::config 'gifuser')"
    export gifuser
fi
if bashio::config.has_value 'gifpassword'; then
    gifpassword="$(bashio::config 'gifpassword')"
    export gifpassword
fi
if bashio::config.has_value 'giforg'; then
    giforg="$(bashio::config 'giforg')"
    export giforg
fi
if bashio::config.has_value 'gifbucket'; then
    gifbucket="$(bashio::config 'gifbucket')"
    export gifbucket
fi
if bashio::config.has_value 'giftoken'; then
    giftoken="$(bashio::config 'giftoken')"
    export giftoken
fi
if bashio::config.has_value 'ginvtypemap'; then
    ginvtypemap="$(bashio::config 'ginvtypemap')"
    export ginvtypemap
fi
if bashio::config.has_value 'gpvdisv1'; then
    gpvdisv1="$(bashio::config 'gpvdisv1')"
    export gpvdisv1
fi

gextension="True"
gextname="grott_ha"
# shellcheck disable=SC2089
gextvar="{\"ha_mqtt_host\": \"$(bashio::services mqtt "host")\", \"ha_mqtt_port\": \"$(bashio::services mqtt "port")\", \"ha_mqtt_user\": \"$(bashio::services mqtt "username")\", \"ha_mqtt_password\": \"$(bashio::services mqtt "password")\"}"

export gextension
export gextname
# shellcheck disable=SC2090
export gextvar

python -u grott.py -v
