FROM nginx:1.27.2

ADD ./setup-port-forwarding-rules.sh /docker-entrypoint.d/99-setup-port-forwarding-rules.sh
