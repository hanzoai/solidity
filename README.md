# Contracts

[![npm][npm-img]][npm-url]
[![build][build-img]][build-url]
[![dependencies][dependencies-img]][dependencies-url]
[![downloads][downloads-img]][downloads-url]
[![license][license-img]][license-url]
[![chat][chat-img]][chat-url]

> Smart contracts developed for the [Hanzo Platform][hanzo]

This is a collection of [Solidity contracts][solidity] developed for the [Hanzo
Platform][hanzo]. Designed to meet a broad range of needs, our contracts play
well with [Truffle][truffle] and provide a cutting edge framework for contract
development.

## Install
```bash
$ npm install @hanzo/contracts
```

## Usage
Import the contracts you want to use:

```solidity

import "@hanzo/contracts/Owned.sol"
import "@hanzo/contracts/Versioned.sol"

contract Version is Owned {
    function version() public pure returns (string) {
        return "1.0.0";
    }

    function boolean() public pure returns (bool) {
        return true;
    }
}

contract Contract is Versioned {}
```

And interact with them as you would normally:


```javascript
let Contract = artifacts.require('./Contract.sol')
let Version  = artifacts.require('./Version.sol')

contract('Contract', async () => {
  let contract, version, proxy = null

  before(async () => {
    contract = await Contract.deployed()
    version  = await Version.deployed()
    await contract.setVersion(version.address)

    // Use current version's ABI and provide simple interface to a versioned
    // smart contract.
    proxy = await Version.at(contract.address)
  })

  it('should return result from proxied method', async () => {
    let v = await proxy.boolean.call()
    assert.equal(v, true, 'boolean() did not return expected boolean')
  })
})
```

You can find more examples of our contracts in use in our [test suite][tests].

# About Hanzo
[Hanzo][hanzo] enables businesses to launch and operate blockchain networks,
develop decentralized applications and deliver compelling experiences.

## License
[BSD][license-url]

[hanzo]:            https://hanzo.ai
[solidity]:         https://solidity.readthedocs.io
[truffle]:          http://truffleframework.com/
[tests]:            https://github.com/hanzoai/contracts/tree/master/test

[build-img]:        https://img.shields.io/travis/hanzoai/contracts.svg
[build-url]:        https://travis-ci.org/hanzoai/contracts
[chat-img]:         https://badges.gitter.im/join-chat.svg
[chat-url]:         https://gitter.im/hanzoai/contracts
[dependencies-img]: https://david-dm.org/hanzoai/contracts.svg
[dependencies-url]: https://david-dm.org/hanzoai/contracts
[downloads-img]:    https://img.shields.io/npm/dm/contracts.svg
[downloads-url]:    http://badge.fury.io/js/contracts
[license-img]:      https://img.shields.io/npm/l/@hanzo/contracts.svg
[license-url]:      https://github.com/hanzoai/contracts/blob/master/LICENSE
[npm-img]:          https://img.shields.io/npm/v/@hanzo/contracts.svg
[npm-url]:          https://www.npmjs.com/package/@hanzo/contracts
