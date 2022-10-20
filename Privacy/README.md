```javascript
contract.unlock(
    (await web3.eth.getStorageAt(contract.address, 5)).substring(0, 34)
)
```