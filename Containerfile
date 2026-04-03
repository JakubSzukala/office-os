FROM quay.io/fedora/fedora-bootc:43

# Part of the image packages
RUN dnf -y install \
    @cinnamon-desktop \
    flatpak \
    greenboot \
    greenboot-default-health-checks \
    && dnf clean all \
    && rm -rf /var/cache/dnf

# Services
COPY install-flatpaks.service /usr/lib/systemd/system/install-flatpaks.service
RUN systemctl enable install-flatpaks.service

# Check
RUN bootc container lint
