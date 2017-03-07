FROM fedora:rawhide

RUN dnf groupinstall -y "C Development Tools and Libraries" && \
    dnf install -y curl file && dnf clean all && \
    curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- -y --disable-sudo --channel=nightly && \
    cargo install artifact-app && \
    dnf group remove "C Development Tools and Libraries" -y &&\
    rustup uninstall nightly
