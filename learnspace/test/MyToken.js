const hre = require("hardhat")
const {expect} = require("chai")
describe("MyToken Test",async()=>{
    const {ethers} = hre
    const initialSupply = 10000;
    let MyTokenContract;
    let account1,account2;    
    beforeEach(async()=>{
        [account1,account2] = await ethers.getSigners();
        console.log(account1,"account1===");
        console.log(account2,"account2===");
        const MyToken = await ethers.getContractFactory("MyToken");
        MyTokenContract =await MyToken.connect(account1).deploy(initialSupply);
        MyTokenContract.waitForDeployment();
        const contractAddress = await MyTokenContract.getAddress();
        expect(contractAddress).to.length.greaterThan(0);

    })
    it("验证合约的name,symbol,decimal",async()=>{
        const name = await MyTokenContract.name();
        const symbol = await MyTokenContract.symbol();
        const decimals = await MyTokenContract.decimals();

        expect(name).to.equal("MyToken");
        expect(symbol).to.equal("MTK");
        console.log(decimals)
    })

    

    it("banlanceofaccount1",async()=>{
        // let balanceofaccount1 = await MyTokenContract.balanceOf(account1);
        // console.log(balanceofaccount1);
        const resp =await MyTokenContract.transfer(account2,initialSupply/2);
        console.log(resp);
        const balanceofaccount2 = await MyTokenContract.balanceOf(account1);

        // console.log(balanceofaccount1,"balanceofaccount1");
        console.log(balanceofaccount2,"balanceofaccount2");
        expect(balanceofaccount2).to.equal(initialSupply /2);

    })

    
})