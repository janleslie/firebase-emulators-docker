ARG NODE_VERSION=hydrogen-alpine
FROM node:${NODE_VERSION}

# Do not forget to set FIREBASE_TOKEN env variable
# if using firebase hosting

ENV JAVA_TOOL_OPTIONS -Xmx4g
ENV GCLOUD_PROJECT_ID=demo

WORKDIR /firebase

RUN apk add openjdk11 gettext && \
    npm install -g firebase-tools && \
    mkdir -p /firebase/data && \
    mkdir -p /firebase/functions && \
    mkdir -p /firebase/public && \
    mkdir -p /firebase/extensions && \
    mkdir -p /root/.cache/firebase

ADD ./emulators /root/.cache/firebase/emulators
ADD static/* .
ADD entrypoint.sh .

# Auth
EXPOSE 9099
EXPOSE 8080
EXPOSE 9000
EXPOSE 4000
EXPOSE 5001
EXPOSE 8085
EXPOSE 9199
EXPOSE 5000
EXPOSE 9299

ENTRYPOINT ["sh", "entrypoint.sh"]
