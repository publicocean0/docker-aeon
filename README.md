# docker-aeon

For generating wallet 

docker exec -it aeon /aeon/aeon-wallet-cli --generate-new-wallet=/aeon/wallet/myWallet

For entering in your wallet 

docker exec -it aeon /aeon/aeon-wallet-cli --wallet-file=/aeon/wallet/myWallet 

For starting mining 

docker exec -itd aeon /xmrigDaemon -o mine.aeon-pool.com:5555 -u <your_wallet_id> -p x -a cryptonight-lite
