# Nextcloud:apache +smb

Original [nextcloud:apache](https://hub.docker.com/_/nextcloud/) image with SMB extension.

## Getting Started

These instructions will cover usage information and for the docker container.

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Container Parameters

The image could be created and started by the following command.  

```shell
$ docker run -d bkhenloo/nextcloud_apache_smb
```

By default the working directory should be mounted. 

```shell
§ docker run -d \
-v <path>:/var/www/html:rw 
bkhenloo/nextcloud_apache_smb
```

#### Environment Variables

#### Volumes

* `/var/www/html/` - folder where all Nextcloud data lives

```shell
$ docker run -d \
-v nextcloud:/var/www/html \
nextcloud
```

#### Useful File Locations

* `/var/lib/mysql` 						- MySQL / MariaDB Data
* `/var/lib/postgresql/data`	- PostgreSQL Data

```shell
$ docker run -d \
-v db:/var/lib/mysql \
mariadb
```

#### Using Podman

```shell
$   podman pod create --name nextcloud --hostname nextcloud \
&&  podman create --pod nextcloud --name nextcloud_db \
    -l "io.containers.autoupdate=image" \
    -e MYSQL_ROOT_PASSWORD=<root passwd> \
    -e MYSQL_DATABASE=<db> \
    -e MYSQL_USER=<user> \
    -e MYSQL_PASSWORD=<passwd> \
    -e REMOTE_SQL= \
    -v <host_db_conf>:/etc/mysql:Z \
    -v <host_db_data>:/var/lib/mysql:Z \
    -t docker.io/mariadb:latest \
&&  podman create --pod nextcloud --name nextcloud_server \
    -l "io.containers.autoupdate=image" \
    -v <host_nc_data>:/var/www/html:Z \
    -t docker.io/BKhenloo/nextcloud_apache_smb:latest
```

* `<root passwd>`   - MariaDB root password
* `<db>`            - MariaDB database prefix
* `<user>`          - MariaDB user
* `<passwd>`        - MariaDB user password
* `<host_db_conf>`  - MariaDB container configruation mount at host filesystem
* `<host_db_data>`  - MariaDB container database mount at host filesystem
* `<host_nc_data>`  - Nextcloud container data mount at host filesystem 

##### Using auto-update feature

If using `podman` Version >=1.9, it should be possible to use the `auto-update` feature with `systemd`.

First create the container (pod) than run `generate` command. The systemd service files will be created within the same folder.
These .service file(s) should be moved to a systemd folder. 
If the system uses SELinux the new files must be updated with the correct labels. 
Then the systemd daemon must reload the service files.

```shell
$ podman generate systemd --new --name nextcloud --files
$ mv *.service /usr/lib/systemd/
$ restorecon -Rv /usr/lib/systemd/
$ systemctl daemon-reload

$ systemctl start pod-nextcloud.service --now
```

## Find Us

* [GitHub](https://github.com/BKhenloo/nextcloud_apache_smb)

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the 
[tags on this repository](https://github.com/BKhenloo/nextcloud_apache_smb/tags). 

## Authors

* **Briezh Khenloo** - *Initial work* - [B.Khenloo](https://github.com/BKhenloo)

See also the list of [contributors](https://github.com/BKhenloo/holdingnuts_server/contributors) who 
participated in this project.

## License

## Acknowledgments
