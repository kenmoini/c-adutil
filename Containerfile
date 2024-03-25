#FROM registry.access.redhat.com/ubi8/ubi-minimal:8.9-1137
FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

RUN curl -o /etc/yum.repos.d/msprod.repo https://packages.microsoft.com/config/rhel/8/prod.repo \
 && ACCEPT_EULA=Y dnf install -y adutil