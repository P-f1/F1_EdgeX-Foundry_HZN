HZN_EXCHANGE_URL=http://192.168.1.212:3090/v1
HZN_ORG_ID=myorg
HZN_EXCHANGE_USER_AUTH=admin:tWyT78HTEroAQ4uWU9wtMfG24O10N7

#mkdir -p ~/hzn/keys && cd ~/hzn/keys
hzn key create myorg chuyang@tibco.com -v
#export PRIVATE_KEY_FILE=$(ls ~/hzn/keys/*-private.key)
#export PUBLIC_KEY_FILE=$(ls ~/hzn/keys/*-public.pem)
#hzn key import --public-key-file=$PUBLIC_KEY_FILE
#hzn key list