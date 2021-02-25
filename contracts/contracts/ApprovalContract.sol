// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ApprovalContract {

  address public sender;
  address payable receiver;
  address constant public approver = 0x5eE4df77b96eAdEd6d72D5C7841b578F6095375c;

 

  function deposit(address payable _receiver) external payable {
    require(msg.value > 0);
    sender = msg.sender;
    receiver = _receiver;
  }

  function viewApprover() external pure returns(address) {
    return(approver);
  }

  function approve() external {
    require(msg.sender == approver);
    receiver.transfer(address(this).balance);
  }


}
