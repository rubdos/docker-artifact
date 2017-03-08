FROM fedora:rawhide

ENV PATH=/root/.cargo/bin:$PATH

# partof: #SPC-install-artifact

RUN dnf groupinstall -y "C Development Tools and Libraries" && \
    dnf install -y curl file && dnf clean all && \
    curl https://sh.rustup.rs -sSf | \
           sh -s -- --default-toolchain nightly -y && \
    rustup run nightly cargo install artifact-app && \
    dnf group remove "C Development Tools and Libraries" -y &&\
    rustup toolchain uninstall nightly
# partof: #SPC-remove-cargo

# partof: #SPC-implement-default-command
CMD ["/root/.cargo/bin/art","ls"]
