pragma solidity =0.6.12;

import "https://github.com/sushiswap/sushiswap/blob/canary/contracts/uniswapv2/UniswapV2Router02.sol";

//SPDX-License-Identifier: MIT;

contract CIT_SwapContract {
        
    address public owner;
    constructor() public{
        owner = msg.sender;
    }
    modifier OnlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    address payable RouterAddr = 0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506;
    
    function SetRouterAddr(address payable _RouterAddr) external OnlyOwner{
        RouterAddr = _RouterAddr;
    }
    
    address[] CIT_Path = [0xc778417E063141139Fce010982780140Aa0cD5Ab];
    
    function SelectTransferToken(address _TokenAddr) external {
        CIT_Path.push(_TokenAddr);
    }
    
    function OurTeams_Swap() external payable {
        UniswapV2Router02 CIT_Router = UniswapV2Router02(RouterAddr);
        CIT_Router.swapExactETHForTokens{value: msg.value}(0, CIT_Path, msg.sender, (block.timestamp + 30 minutes));
    }
    
}
