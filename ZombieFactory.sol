//SPDX-License-Identifier:MIT;
pragma solidity ^0.8.0;

contract ZombieFactory {
    //state variable init 
    uint dnaDigits = 16;
    uint dnaModulus = 10**dnaDigits;

    //Zombie structure
    struct Zombie{
        string name;
        uint dna;
    }

    //array declaration of Zombies
    Zombie[] zombies;

    //create Zombie function
    function _createZombie(string memory _name,uint _dna) private{
        zombies.push(Zombie(_name,_dna));
    }

    //create random dna
    function _createRandomDna(string memory _name) private view returns(uint){
        uint rand = uint(keccak256(abi.encodePacked(_name)));
        //modulus to 16 to generate 16 digits
        return rand%dnaModulus;
    }

    //create random zombie using _createRandomDna and ush it to _createZombie
    function createRandomZombie(string memory _name) public {
        uint randDna = _createRandomDna(_name);
        _createZombie(_name,randDna);
    }
    



}
