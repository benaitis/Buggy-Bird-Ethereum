pragma solidity ^0.4.21;
contract PlayerScore {

    struct playerData {
        address player;
        uint lastscore;
        uint totalscore;
        uint timesplayed;
        uint bestscore;
    }

    uint alltimebest;
    
    mapping (address => playerData) players;

    constructor() public{
        alltimebest=0;
        players[msg.sender].bestscore=0;
    }

   function getlatestScore() public constant returns(uint)
   {
     return players[msg.sender].lastscore;
   }

   function getTimesPlayed() public constant returns(uint)
   {
       return players[msg.sender].timesplayed;
   }

   function addScore(uint _score) public {
       if(_score > alltimebest){
           alltimebest = _score;
       }
       if(_score > players[msg.sender].bestscore)
       {
           players[msg.sender].bestscore =_score;
       }
       players[msg.sender].totalscore += _score;
       players[msg.sender].lastscore = _score;
       players[msg.sender].timesplayed++;
   }

   function getalltimebest() public constant returns(uint)
   {
       return alltimebest;
   }

   function getpersonalbest() public constant returns(uint)
   {
       return players[msg.sender].bestscore;
   }

   function gettotalpersonalscore() public constant returns(uint)
   {
       return players[msg.sender].totalscore;
   }
}
