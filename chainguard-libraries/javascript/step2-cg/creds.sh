eval $(chainctl auth pull-token \
  --output env \
  --repository=javascript \
  --parent=$ORG_NAME)

export token=$(echo -n "${CHAINGUARD_JAVASCRIPT_IDENTITY_ID}:${CHAINGUARD_JAVASCRIPT_TOKEN}" | base64 -w 0)

npm config set registry https://libraries.cgr.dev/javascript/ --location=project
npm config set //libraries.cgr.dev/javascript/:_auth "${token}" --location=project
