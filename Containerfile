FROM docker.io/jenkins/jenkins:2.580.3-lts-jdk25@sha256:4d85f6cf5a8939647921564952d12a5a761f32a3bc520c2f4e5c3cafa7ea660f

USER root

# Pin the Bitwarden CLI version for the Bitwarden Credentials Provider Plugin
ARG BW_CLI_VERSION="2026.11.1"

# Download the x86 BW CLI zip file directly from GitHub releases
RUN curl -Lso bw.zip "https://github.com/bitwarden/clients/releases/download/cli-v${BW_CLI_VERSION}/bw-oss-linux-${BW_CLI_VERSION}.zip" \
    && unzip bw.zip -d /usr/local/bin/ \
    && rm bw.zip \
    && chmod +x /usr/local/bin/bw

USER jenkins

COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

HEALTHCHECK --interval=30s --timeout=5s --start-period=60s CMD curl -fSs -o /dev/null http://localhost:8080/health || exit 1
