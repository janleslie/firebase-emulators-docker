# Firebase Emulators Docker

This repository contains a Docker image for running the Firebase emulators.

Each emulator runs on a separate port:

- **Auth**: 9099
- **Firestore**: 8080
- **Database**: 9000
- **UI**: 4000
- **Functions**: 5001
- **PubSub**: 8085
- **Storage**: 9199
- **Hosting**: 5000
- **Eventarc**: 9299

Do not forget to publish the ports when running the container or use `--network host` option.

## Usage

```bash
docker pull tomasvotava/firebase-emulators
docker run --network host tomasvotava/firebase-emulators
```

### Only run specific emulators

```bash
docker run -p 9099:9099 -p 8080:8080 tomasvotava/firebase-emulators auth,firestore
```

### Set project id

```bash
docker run --network host -e GCLOUD_PROJECT_ID=your-project-id tomasvotava/firebase-emulators
```

### Import/Export data

The data is automatically imported from /firebase/data directory.

If you want to export the data, mount the directory to the container.

```bash
docker run -it --network host -v /path/to/data:/firebase/data tomasvotava/firebase-emulators
```

When you hit `Ctrl+C` the data will be exported to `/path/to/data` directory.

### Emulators requiring authentication

Set `FIREBASE_TOKEN` env variable to authenticate emulators requiring authentication.

```bash
docker run --network host -e FIREBASE_TOKEN=your-token tomasvotava/firebase-emulators
```
