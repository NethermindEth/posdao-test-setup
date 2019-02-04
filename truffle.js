module.exports = {
  rpc: {
    host: "localhost",
    port: 8541
  },
  networks: {
    development: {
      host: "localhost",
      port: 8541,
      network_id: "*",
      from: "0xbbcaa8d48289bb1ffcf9808d9aa4b1d215054c78",
      gas: 8000000,
      gasPrice: 100000
    }
  }
};
