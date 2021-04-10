#!/bin/bash

[[ -z "${JAVA_HOME}" ]] && export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
