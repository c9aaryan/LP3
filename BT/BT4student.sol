// SPDX-License-Identifier: MIT
// Solidity program to implement
// the above approach
pragma solidity >=0.7.0 <0.9.0;

// Build the Contract
contract MarksManagmtSys {
    // Create a structure for
    // student details
    struct Student {
        int256 ID;
        string fName;
        string lName;
        int256 marks;
    }
    address owner;
    int256 public stdCount = 0;
    mapping(int256 => Student) public stdRecords;
    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Create a function to add
    // the new records
    function addNewRecords(
        int256 _ID,
        string memory _fName,
        string memory _lName,
        int256 _marks
    ) public onlyOwner {
        // Increase the count by 1
        stdCount = stdCount + 1;
        // Fetch the student details
        // with the help of stdCount
        stdRecords[stdCount] = Student(_ID, _fName, _lName, _marks);
    }

    // Create a function to add bonus marks
    function bonusMarks(int256 _bonus) public onlyOwner {
        stdRecords[stdCount].marks = stdRecords[stdCount].marks + _bonus;
    }
}
