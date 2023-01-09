fission spec init
fission env create --spec --name wbh-caf-cpf-env --image nexus.sigame.com.br/fission-webhook-caf-cpf:0.1.0-0 --poolsize 0 --version 3 --imagepullsecret "nexus-v3" --spec
fission fn create --spec --name wbh-caf-cpf-fn --env wbh-caf-cpf-env --code fission.py --targetcpu 80 --executortype newdeploy --maxscale 3 --requestsperpod 10000 --spec
fission route create --spec --name wbh-caf-cpf-rt --method POST --url /webhook/caf/cpf_validation --function wbh-caf-cpf-fn
