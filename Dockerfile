FROM fedora:rawhide

ENV PATH=/root/.cargo/bin:$PATH
RUN dnf groupinstall -y "C Development Tools and Libraries" && \
    dnf install -y curl file && dnf clean all && \
    curl https://sh.rustup.rs -sSf | \
           sh -s -- --default-toolchain nightly -y && \
    rustup run nightly cargo install artifact-app && \
    dnf group remove "C Development Tools and Libraries" -y &&\
    rustup toolchain uninstall nightly

ENTRYPOINT ["/root/.cargo/bin/art"]
CMD ["ls"]
