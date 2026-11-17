FROM nginx:1.30.6

ADD ./setup-port-forwarding-rules.sh /docker-entrypoint.d/99-setup-port-forwarding-rules.sh
