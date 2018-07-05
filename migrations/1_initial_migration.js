const Migrations = artifacts.require("./Migrations.sol") // Required by truffle

const TestDelegate   = artifacts.require("./test/TestDelegate.sol")
const TestProxy      = artifacts.require("./test/TestProxy.sol")
const TestVersion    = artifacts.require("./test/TestVersion.sol")
const TestVersioned  = artifacts.require("./test/TestVersioned.sol")

module.exports = (deployer) => {
  deployer.deploy([
    Migrations,
    TestDelegate,
    TestProxy,
    TestVersion,
    TestVersioned,
  ])
}
