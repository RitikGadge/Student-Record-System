// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Project {
    struct Student {
        uint id;
        string name;
        uint marks;
    }

    mapping(uint => Student) private students;
    uint public studentCount;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Add a new student
    function addStudent(string memory _name, uint _marks) public {
        require(msg.sender == owner, "Only owner can add students");
        studentCount++;
        students[studentCount] = Student(studentCount, _name, _marks);
    }

    // Get student details
    function getStudent(uint _id) public view returns (string memory, uint) {
        require(_id > 0 && _id <= studentCount, "Invalid student ID");
        Student memory s = students[_id];
        return (s.name, s.marks);
    }

    // Update marks
    function updateMarks(uint _id, uint _marks) public {
        require(msg.sender == owner, "Only owner can update marks");
        require(_id > 0 && _id <= studentCount, "Invalid student ID");
        students[_id].marks = _marks;
    }
}


