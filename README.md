# Error Handling

The basic purpose is to make code more accurate by using error handling statements that is require, revert and assert statements.

## Description

We created a smart contract name GradingSystems. In this,it is basically for calculation of grades in school time where the need of error handling is important alot. I used require,revert and assert to handle the problems occuring in calculation time.

## Getting Started

### Installing

1. Install errorhandling.sol file of mine.
2. Run on Remix.
3. compile
4. deloy.
5. test al conditions.

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:
```javascript
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
```
## Authors

TANU PAL
@Tanu


## License

This project is licensed under the Meta License.
