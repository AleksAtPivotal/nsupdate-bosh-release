# nsupdate-bosh-release

Bosh Release intended to nsupdate a DDNS server.

## Getting Started

Download the release tarball

```sh
wget https://github.com/alekssaul/nsupdate-bosh-release/raw/master/releases/nsupdate-bosh-1.0.0-beta.2.tgz
```

Upload the release to bosh director

```sh
bosh upload-release nsupdate-bosh-1.0.0-beta.2.tgz
```

Edit the `bosh-addon.yml` file to change the base DNS Zone under `search` property i.e.;

```yaml
releases:
- name: nsupdate-bosh
  version: 1.0.0-beta.2
addons:
- name: nsupdate-custom
  jobs:
  - name: custom-dns-update
    release: nsupdate-bosh
    properties:
      nsupdate-bosh:
        search: "pks.my.company.com"
```

Update the bosh runtime configuration

```sh
bosh update-runtime-config bosh-addon.yml
```
