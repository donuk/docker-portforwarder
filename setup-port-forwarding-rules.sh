#!/bin/bash -e

main() {
    mkdir -p /etc/nginx/ports.d
    setup_mappings /etc/nginx/ports.d
    install_ports_to_nginx_conf
}

install_ports_to_nginx_conf() {
    sed '/http\|stream/,$ d' -i /etc/nginx/nginx.conf
    echo "stream { include /etc/nginx/ports.d/*.conf; }" >> /etc/nginx/nginx.conf
}
setup_mappings() {
    DIR=$1
    get_port_mappings | while read incoming_port forwarded_host forwarded_port; do
        if [ "$forwarded_port" = "" ]; then
            forwarded_port=$incoming_port
        fi

        generate_port_forwarding_config $incoming_port $forwarded_host $forwarded_port > $DIR/forward-$incoming_port.conf
    done
}

get_port_mappings() {
    set | grep "^PORT_" | sed 's/PORT_//; s/[=:]/ /g'
}

generate_port_forwarding_config() {
    inport="$1"
    outhost="$2"
    outport="$3"
cat <<EOF
    upstream backend_$inport {
        server $outhost:$outport;
    }

    server {
        listen $inport;
        proxy_pass backend_$inport;
    }
EOF
}

main
