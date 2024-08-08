# Use the same base image as the original geth image
FROM ethereum/client-go:base

# Copy the blockchain state into the image
COPY ethereum_data /root/.ethereum

# Run the Geth node with the appropriate flags
CMD ["geth", "--dev", "--dev.period=12", "--http", "--http.addr=0.0.0.0", "--http.port=8545", "--http.corsdomain='*'", "--http.api=eth,net,web3,personal,debug", "--allow-insecure-unlock", "--verbosity=4", "--datadir=/root/.ethereum"]
