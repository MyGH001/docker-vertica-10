# docker images for Micro Focus Vertica 10

Docker images collection for Vertica database, forked from https://github.com/jbfavre/vertica

Vertica is a column oriented database from Micro Focus.  
It's available with both a free community license allowing up to 1 TB data on up to 3 nodes, and an enterprise license allowing larger data sets and clusters.

## News

* __2020, May. 31st__:  
  Adding Vertica 10 on CentOS 7.x

## Flavours

Following Vertica/Operating systems versions are provided:
- Vertica 10.x (currently 10.0)
  * on CentOS 7 (Thanks to @pcerny for the work)

__latest__ tag follows the CentOS image.

## Usage

You can use the image without persistent data store:

    docker run -p 5433:5433 bryanherger/vertica:10.0.0-0_centos-7

Or with persistent data store:

    docker run -p 5433:5433 -d \
               -v /path/to/vertica_data:/home/dbadmin/docker \
               bryanherger/vertica:10.0.0-0_centos-7

Or with custom database name (default is "docker") or database password (default is no password):

    docker run -p 5433:5433 -e DATABASE_NAME='notdocker' -e DATABASE_PASSWORD='foo123' jbfavre/vertica:9.2.0-7_debian-8

Or, you can try Eon mode by passing the following environment variables.  This should work with AWS, Pure Storage, and MinIO endpoints:

    AWS_ACCESS_KEY_ID (required)
    AWS_SECRET_ACCESS_KEY (required)
    AWS_ENDPOINT (required)
    COMMUNAL_STORAGE (required, specify URI as s3://bucket/path)
    AWS_REGION (optional, default us-west-1
    AWS_ENABLE_HTTPS (optional, default 0 / false)
    EON_SHARD_COUNT (optional, default 3)

## How to build from Dockerfile

You have to get relevant Vertica package from my.vertica.com (registration mandatory).  
Save it in packages directory.

Then, use following command:

make build

The Makefile wraps the docker build command, copy the command(s) from there to cuastomize the build.

## Want to contribute ?

Fork, dev, make a PR :)
