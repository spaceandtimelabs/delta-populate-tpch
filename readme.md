# delta-populate-tpch

A kotlin project to put TPC-H data into DeltaLake tables.

## Usage

```shell
docker run -it  -v "$(pwd)/data":/data ghcr.io/databloom-ai/tpch-docker:main -v -s 0.1
```