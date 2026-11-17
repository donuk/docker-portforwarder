FROM nginx:1.31.8

ADD ./setup-port-forwarding-rules.sh /docker-entrypoint.d/99-setup-port-forwarding-rules.sh
