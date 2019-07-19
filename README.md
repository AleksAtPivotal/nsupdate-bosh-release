# nsupdate-bosh-release

Bosh Release intended to nsupdate a DDNS server.

## Getting Started

Download the release tarball

```sh
wget
```

Upload the release to bosh director

```sh
bosh upload-release nsupdate-bosh-1.0.0-beta.2.tgz
```

Update the bosh runtime configuration

```sh
bosh update-runtime-config bosh-addon.yml
```
