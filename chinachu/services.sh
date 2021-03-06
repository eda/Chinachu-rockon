#!/bin/bash
if [ ! -f /usr/local/chinachu/conf/config.json ]; then
cat /usr/local/chinachu/config.sample.json > /usr/local/chinachu/conf/config.json
fi
/etc/init.d/chinachu-operator start
/etc/init.d/chinachu-wui start

### failed to run with an error by `ps -p` option
# exec bash --rcfile <(cat <<<"trap '/etc/init.d/chinachu-wui stop; /etc/init.d/chinachu-operator stop; exit 0' TERM")

trap 'echo "Stopping services..."; /etc/init.d/chinachu-wui stop; /etc/init.d/chinachu-operator stop; echo done.; sleep 3; exit 0' TERM
while true; do sleep 1; done
