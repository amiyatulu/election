pragma solidity >=0.4.22 <0.7.0;


contract Election {

    // Model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    // Storing accounts that have voted
    mapping(address => bool) public voters;

    // Store candidate
    // Fetch Candidate
    mapping(uint => Candidate) public candidates;

     // Store candidate count
    uint public candidatesCount;

    // voted event
    event votedEvent(
        uint indexed _candidateId
    );
    constructor () public {
       addCandidate("Candidate 1");
       addCandidate("Candidate 2");
    }

    function addCandidate(string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
    function vote(uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender], "Sender not authorized");

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Candidate is not valid");

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

        // trigger voted event
        emit votedEvent(_candidateId);
    }
}