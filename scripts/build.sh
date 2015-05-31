#!/bin/bash
set -ex

mix do local.hex --force, local.rebar --force, deps.get
npm install
mix compile
