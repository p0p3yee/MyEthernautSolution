```javascript
web3.eth.sendTransaction(
    {
        from: player,
        to: "token contract address",
        data: "0x00f55d9d000000000000000000000000" + player.substring(2)
    }
)
```

I just get the address from etherscan, you can also calucate the address by using the keccak256 hash the instance address and the nonce