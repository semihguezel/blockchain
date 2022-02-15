// SPDX-License_Identifier: MIT

pragma solidity ^0.6.0;

import "./SimpleStorage.sol";

contract StorageFactory {

    // To keep track of created SimpleStorage contrat we initialize an array
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        //Creating an object type of SimpleStorage contract
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //For interacting a contract we need two information, Address of deployed contract and ABI
        //ABI: Application Binary Interface, we derived it by importing 

        //We derived deployed contract adress from simpleStorageArray by their indexes
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
    }

    //view stands for we onyl want to observe of the returned object so there will be no change on blockchain
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
    }
}
