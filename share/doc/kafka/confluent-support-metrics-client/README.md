# Confluent Proactive Support: Client

# Overview

This repository contains the client application for metrics collection of proactive support.


# Development

## Requirements

This project requires Kafka 0.9 built against Scala 2.11, which as of 02-Nov-2015 is not yet officially released.
You must therefore manually build Kafka and install it to your local Maven repository:

```shell
# Install Kafka trunk/master (w/ Scala 2.11) to local maven directory
$ git clone git@github.com:confluentinc/kafka.git && cd kafka
$ ./gradlew -PscalaVersion=2.11.7 clean install
```

Also, this project requires [support-metrics-common](https://github.com/confluentinc/support-metrics-common), which
you may need to build and install locally prior to running the build for this project.


## Building

This project uses the standard maven lifecycles such as:

```shell
$ mvn compile
$ mvn test
$ mvn package # creates the jar file
```


## Packaging and releasing

By convention we create release branches of the same name as Kafka _version_ they are integrating with (cf.
`KAFKA_VERSION`.

For example, the code of this project for collecting metrics from Apache Kafka version `0.9.0.0` must be maintained
in a shared branch named `0.9.0.0`.  However, this project's maven `<version>` defined [pom.xml](pom.xml) must match
`CONFLUENT_VERSION` (like other CP
projects such as [kafka-rest](https://github.com/confluentinc/kafka-rest/)).

```
Branch `0.9.0.0` => code to integrate with Apache Kafka version 0.9.0.0 release
           |
           |
           +-- /pom.xml (top-level)
                   |
                   | defines
                   |
                   V
                <project>
                  ...
                  <version>2.0.0</version>  => for Confluent Platform 2.0.0 release
                  ...
                </project>
```