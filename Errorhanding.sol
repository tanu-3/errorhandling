// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GradingSystems {
    enum Grade { A, B, C ,D , E, F}

    mapping(address => Grade) public grades;

    event GradeAssigned(address student, Grade grade);

    function assignGrade(address student, uint8 marks) public {
       
        require(marks >= 0 && marks <= 32, "Invalid marks. Marks should be between 0 and 32");

       
        uint8 gradeValue = marks / 15;  

        assert(gradeValue >= 0 && gradeValue <= 5);

        Grade grade;
        if (gradeValue == 5) {
            grade = Grade.A;
        } else if (gradeValue == 4) {
            grade = Grade.B;
        } else if (gradeValue == 3) {
            grade = Grade.C;
        } else if (gradeValue == 2) {
            grade = Grade.D;
        } else if (gradeValue == 1) {
            grade = Grade.E;
        }else if (gradeValue == 0) {
            grade = Grade.F;
        }else {
            revert("Invalid grade.");
        }
        grades[student] = grade;
        emit GradeAssigned(student, grade);
    }
}

