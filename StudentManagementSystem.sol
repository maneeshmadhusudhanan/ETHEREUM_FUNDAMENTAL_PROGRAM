// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract SMS{

    enum Department { CS, EC, ME }
    address public staffadvisor;

    struct Student{
      string name;
      uint8 sem;
      Department dept;
      uint8 CGPA;
      uint40 rollno;
      bool exist;
    }

    mapping(uint40 => Student) private studentDetails;

     
    constructor() {
        staffadvisor = msg.sender;
    }

    modifier admin(){
        require(msg.sender == staffadvisor,"Stafadvisor only have  access to this Function");
        _;
    }
    modifier verifyStudent(uint40 rollno){
        require(studentDetails[rollno].exist,"Student Roll Number does not exist");
        _;
    }

    function addStudent(string memory _name,uint8 _sem,Department _dept,uint8 _CGPA,uint40 _rollno) public  admin {
            
            require(!studentDetails[_rollno].exist, "StudentRoll number is already exists");
            studentDetails[_rollno] = Student(_name,_sem,_dept,_CGPA,_rollno,true);
    }

     function getStudent(uint40 _rollno) public view admin returns (string memory name, uint8 sem, Department dept, uint8 CGPA, uint40 rollno) {
        
        Student memory student = studentDetails[_rollno];
        return (student.name, student.sem, student.dept, student.CGPA, student.rollno);
    }

    function editData(uint8 _sem,Department _dept,uint8 _CGPA,uint40 _rollno) public admin verifyStudent(_rollno){

                Student storage student = studentDetails[_rollno];
                student.sem= _sem;
                student.dept = _dept;
                student.CGPA = _CGPA; 
    }

    function editName(string memory _name,uint40 _rollno) public verifyStudent(_rollno){

                Student storage student = studentDetails[_rollno];
                student.name= _name;
               
    }




}