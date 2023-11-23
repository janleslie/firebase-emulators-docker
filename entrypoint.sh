#!sh

set -e

echo "Using project id: ${GCLOUD_PROJECT_ID}"

envsubst </firebase/.firebaserc.template >/firebase/.firebaserc

if [ -z "$1" ]; then
    echo "Starting all emulators"
    ONLY=""
else
    echo "Starting emulators: $1"
    ONLY="--only $1"
fi

firebase emulators:start ${ONLY} --import=/firebase/data --export-on-exit=/firebase/data
