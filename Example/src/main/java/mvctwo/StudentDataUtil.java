package mvctwo;

import java.util.ArrayList;

import java.util.List;

public class StudentDataUtil {
    public static List<Student> getStudents(){

        List<Student> students = new ArrayList<>();
        students.add(new Student(1,"Nguyen","Phuong Nam",true));
        students.add(new Student(2,"Tran","Phuong Nam",false));
        students.add(new Student(3,"Dao","Phuong Nam",false));
        return students;
    }

}
