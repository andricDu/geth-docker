FROM ubuntu:latest

# Get the Ethereum Stuffs
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y build-essential golang git
RUN git clone https://github.com/ethereum/go-ethereum

WORKDIR /go-ethereum
RUN make geth

WORKDIR /

# House the data here
RUN mkdir /block-data


# Pass in the genesis block. 
COPY GenesisBlock.json GenesisBlock.json

RUN ln -sf /go-ethereum/build/bin/geth /bin/geth

RUN geth --datadir /block-data init /GenesisBlock.json 

ENTRYPOINT geth --identity "OIRC" --rpc --rpcport "8546" --rpccorsdomain "*" --datadir "/block-data" --port "30303" --nodiscover --ipcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3" --rpcapi "db,eth,net,web3,personal" --autodag --networkid 123456789 --nat "any" console 
