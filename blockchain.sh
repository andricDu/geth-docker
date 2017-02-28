#!/bin/bash
geth --datadir /block-data init /GenesisBlock.json 
geth --identity "MYPRIVATECHAIN" --rpc rpcaddr 0.0.0.0 --rpcport "8546" --rpccorsdomain "*" --datadir "/block-data" --port "30303" --nodiscover --ipcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3" --rpcapi "db,eth,net,web3,personal" --autodag --networkid 123456789 --nat "any" console 