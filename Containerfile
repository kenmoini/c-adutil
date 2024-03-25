#FROM registry.access.redhat.com/ubi8/ubi:latest
FROM quay.io/centos/centos:stream9

RUN curl -o /etc/yum.repos.d/msprod.repo https://packages.microsoft.com/config/rhel/8/prod.repo \
 && ACCEPT_EULA=Y dnf install -y adutil openldap-compat