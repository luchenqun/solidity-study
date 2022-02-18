// pragma solidity ^0.5.0;

// contract Charity {
//     mapping(address => uint256) public donations;

//     function processDonation(address user) external payable {
//         donations[user] += msg.value;
//     }
// }

// contract Receiver {
//     event ValueReceived(address user, uint256 amount);

//     function() external payable {
//         emit ValueReceived(msg.sender, msg.value);
//     }
// }

// contract CharitySplitter {
//     function donate(Charity charity) external payable {
//         charity.processDonation.value(msg.value)(msg.sender);
//     }
// }

import "hardhat/console.sol";
pragma solidity ^0.6.0;

contract Charity {
    mapping(address => uint256) public donations;

    function processDonation(address user) external payable {
        console.log("processDonation");
        donations[user] += msg.value;
    }
}

contract Receiver {
    event ValueReceived(address user, uint256 amount);

    fallback() external payable {
        console.log("fallback");
    }

    receive() external payable {
        console.log("receive");
        emit ValueReceived(msg.sender, msg.value);
    }
}

contract CharitySplitter {
    function donate(Charity charity) external payable {
        charity.processDonation{value: msg.value}(msg.sender);
    }
}
