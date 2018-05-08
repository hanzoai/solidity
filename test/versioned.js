let Versioned = artifacts.require('./test/TestVersioned.sol')
let Version   = artifacts.require('./test/TestVersion.sol')


contract('Versioned', async () => {
  let contract, version, proxy = null

  before(async () => {
    // Make sure our contract and initial version are deployed
    contract = await Versioned.deployed()
    version  = await Version.deployed()

    // Update contract to use our newly deployed version
    await contract.setVersion(version.address)

    // Use Delegate's ABI with proxy's address
    proxy = await Version.at(contract.address)
  })

  it('should set version', async () => {
    let v = await contract.delegate.call()
    assert(v === version.address, 'incorrect version of contract returned')
  })

  it('should return result from proxied method', async () => {
    let v = await proxy.boolean.call()
    assert.equal(v, true, 'boolean() did not return expected boolean')
  })
})
