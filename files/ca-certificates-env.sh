# Point common tools at the system certificate store so they don't
# silently use their own bundled CA bundle and miss corporate certs.
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
export SSL_CERT_DIR=/etc/ssl/certs
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
export NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-certificates.crt
export GIT_SSL_CAINFO=/etc/ssl/certs/ca-certificates.crt
export CARGO_HTTP_CAINFO=/etc/ssl/certs/ca-certificates.crt
export GRPC_DEFAULT_SSL_ROOTS_FILE_PATH=/etc/ssl/certs/ca-certificates.crt
export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
export PIP_CERT=/etc/ssl/certs/ca-certificates.crt
