#!/bin/bash
set -ex

mix do ecto.create, ecto.migrate
