pragma solidity >=0.4.22 <0.7.0;


contract Election {
    string public candidate;

    constructor () public {
        candidate = "Candidate 1";
    }
}