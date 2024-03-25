#FROM registry.access.redhat.com/ubi8/ubi:latest
FROM quay.io/centos/centos:stream9

RUN curl -o /etc/yum.repos.d/msprod.repo https://packages.microsoft.com/config/rhel/8/prod.repo \
 && ACCEPT_EULA=Y dnf install -y adutil openldap-compat \
 && dnf clean all \
 && rm -rf /var/cache/dnf \
 && rm -rf /tmp/*

COPY 0_file_cache /etc/krb5.conf.d/0_file_ccache

#USER 1001