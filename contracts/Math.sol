pragma solidity ^0.4.18;
contract Math {
    uint storedData;
    event Hello(
        uint _value
    );

    function add(uint x) public {
        storedData = storedData + x;
    }

    function sub(uint x) public {
        storedData = storedData - x;
    }

    function mul(uint x) public {
        storedData = storedData * x;
    }

    function div(uint x) public {
        storedData = storedData / x;
    }
    function get() public returns (uint retVal) {
        Hello(storedData);
        return storedData;
    }
}