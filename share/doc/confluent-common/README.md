Confluent Commons
=================

Contains 3 libraries: [metrics](metrics), [config](config), [utils](utils).


# Development

## Overview

Typically you will run standard maven commands such as `mvn install` from the top-level directory (i.e. the directory
that contains this `README` file).  The sections below explain how to build specific sub-projects independently.


## Metrics

To build the `metrics` sub-project independently, run this from the parent directory:

    $ mvn -pl :common-metrics package


## Config

To build the `config` sub-project independently, run this from the parent directory:

    $ mvn -pl :common-config package


## Utils

To build the `utils` sub-project independently, run this from the parent directory:

    $ mvn -pl :common-utils package
