pragma solidity ^0.4.0;

// 0xca35b7d915458ef540ade6068dfe2f44e8fa733c
// 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c
// 0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db
// 0x583031d1113ad414f02576bd6afabfb302140225
// 0xdd870fa1b7c4700f2bd7f44238821c26f7392148

contract RenuoGifcoin {
    struct Person {
        uint budget;
        uint budget_reset_at;
        uint coin_amount;
        string[] coin_messages;
    }

    mapping(address => Person) public people;

    function RenuoGifcoin() {

    }

    function give(address _to, string _message) {
        if (msg.sender == _to) return;

        Person giver = people[msg.sender];
        Person receiver = people[_to];

        if (giver.budget_reset_at < now - 30.4375 days) {
           giver.budget = 10;
           giver.budget_reset_at = now;
        }

        if (giver.budget > 0) {
            giver.budget--;
            receiver.coin_amount++;
            receiver.coin_messages.push(_message);
        }
    }

    function coin_message(uint index) constant returns (string) {
        return people[msg.sender].coin_messages[index];
    }
}

