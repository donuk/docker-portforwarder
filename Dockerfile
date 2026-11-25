FROM nginx:1.31.9

ADD ./setup-port-forwarding-rules.sh /docker-entrypoint.d/99-setup-port-forwarding-rules.sh
