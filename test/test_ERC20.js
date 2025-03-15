const ERC20 = artifacts.require("ERC20");

contract("ERC20", accounts => {
    const [owner, recipient, spender] = accounts;

    it("should deploy the ERC20 contract", async () => {
        const instance = await ERC20.deployed();
        assert(instance.address !== "");
    });

    it("should have the correct total supply", async () => {
        const instance = await ERC20.deployed();
        const totalSupply = await instance.totalSupply();
        assert.equal(totalSupply.toNumber(), 1000000);
    });

    it("should transfer tokens correctly", async () => {
        const instance = await ERC20.deployed();
        await instance.transfer(recipient, 100, { from: owner });
        const balance = await instance.balanceOf(recipient);
        assert.equal(balance.toNumber(), 100);
    });

    it("should approve tokens correctly", async () => {
        const instance = await ERC20.deployed();
        await instance.approve(spender, 200, { from: owner });
        const allowance = await instance.allowance(owner, spender);
        assert.equal(allowance.toNumber(), 200);
    });

    it("should transfer tokens from correctly", async () => {
        const instance = await ERC20.deployed();
        await instance.approve(spender, 200, { from: owner });
        await instance.transferFrom(owner, recipient, 100, { from: spender });
        const balance = await instance.balanceOf(recipient);
        assert.equal(balance.toNumber(), 200);
    });

    it("should mint tokens correctly", async () => {
        const instance = await ERC20.deployed();
        await instance.mint(1000, { from: owner });
        const totalSupply = await instance.totalSupply();
        assert.equal(totalSupply.toNumber(), 1001000);
    });

    it("should burn tokens correctly", async () => {
        const instance = await ERC20.deployed();
        await instance.burn(500, { from: owner });
        const totalSupply = await instance.totalSupply();
        assert.equal(totalSupply.toNumber(), 1000500);
    });
});