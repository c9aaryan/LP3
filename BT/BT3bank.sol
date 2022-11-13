// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract MyBank {
    mapping(address => uint256) private _balances;
    address public owner;
    event LogDepositeMade(address accountHoder, uint256 amount);

    constructor() public {
        owner = msg.sender;
        emit LogDepositeMade(msg.sender, 1000);
    }

    function deposite() public payable returns (uint256) {
        require(
            (_balances[msg.sender] + msg.value) > _balances[msg.sender] &&
                msg.sender != address(0)
        );
        _balances[msg.sender] += msg.value;
        emit LogDepositeMade(msg.sender, msg.value);
        return _balances[msg.sender];
    }

    function withdraw(uint256 withdrawAmount) public returns (uint256) {
        require(_balances[msg.sender] >= withdrawAmount);
        require(msg.sender != address(0));
        require(_balances[msg.sender] > 0);
        _balances[msg.sender] -= withdrawAmount;
        payable(msg.sender).transfer(withdrawAmount);
        emit LogDepositeMade(msg.sender, withdrawAmount);
        return _balances[msg.sender];
    }

    function viewBalance() public view returns (uint256) {
        return _balances[msg.sender];
    }
}
