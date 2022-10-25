#!/bin/bash

fission spec init
fission env create --spec --name caf-cpf-val-env --image nexus.sigame.com.br/fission-async:0.1.7 --builder nexus.sigame.com.br/fission-builder-3.8:0.0.1
fission fn create --spec --name caf-cpf-val-fn --env caf-cpf-val-env --src "./func/*" --entrypoint main.caf_transaction --executortype newdeploy --maxscale 3
fission route create --spec --name caf-cpf-val-rt --method POST --url /webhook/caf/cpf_validation --function caf-cpf-val-fn