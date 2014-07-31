#!/bin/bash
psql -d healthgeist -c "CREATE EXTENSION postgis;"
psql -d healthgeist -c "CREATE EXTENSION postgis_topology;"

