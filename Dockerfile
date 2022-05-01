FROM alpine:3

ARG HADOLINT_VERSION="2.9.2"
ARG TFSEC_VERSION="1.13.0"

RUN apk add --no-cache --update \
        curl \
        shellcheck \
    && rm -rf /var/cache/apk/* \
    # HADOLINT
    && curl -L https://github.com/hadolint/hadolint/releases/download/v${HADOLINT_VERSION}/hadolint-Linux-x86_64 > /usr/bin/hadolint \
    && chmod +x /usr/bin/hadolint \
    # TFSEC
    && curl -L https://github.com/aquasecurity/tfsec/releases/download/v${TFSEC_VERSION}/tfsec-linux-amd64 > /usr/bin/tfsec \
    && chmod +x /usr/bin/tfsec \
    # TESTs
    && /usr/bin/hadolint --version \
    && tfsec --version \
    && shellcheck --version 
