FROM fedora:latest

ENV PATH=/root/.cargo/bin:$PATH

# partof: #SPC-install-artifact

RUN dnf groupinstall -y "C Development Tools and Libraries" && \
    dnf install -y curl file openssh-clients rsync && \
    dnf clean all && \
    curl https://sh.rustup.rs -sSf | \
           sh -s -- --default-toolchain nightly -y && \
    rustup run nightly cargo install --root=/usr artifact-app && \
    rustup self uninstall && \
    rm -rf ~./cargo ~/.rustup && \
    dnf group remove "C Development Tools and Libraries" -y
# partof: #SPC-remove-cargo

# partof: #SPC-implement-default-command
CMD ["/root/.cargo/bin/art","ls"]
