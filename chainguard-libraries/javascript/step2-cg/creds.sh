eval $(chainctl auth pull-token \
  --output env \
  --repository=javascript \
  --parent=$ORG_NAME)

export TOKEN="$(printf '%s' "${CHAINGUARD_JAVASCRIPT_IDENTITY_ID}:${CHAINGUARD_JAVASCRIPT_TOKEN}" | base64 | tr -d '\n')"

cat <<EOF > .npmrc
registry=https://libraries.cgr.dev/javascript/
//libraries.cgr.dev/javascript/:_auth="${TOKEN}"
EOF
