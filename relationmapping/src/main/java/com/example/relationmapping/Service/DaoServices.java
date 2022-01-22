package com.example.relationmapping.Service;

import com.example.relationmapping.Model.*;
import com.example.relationmapping.Repo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class DaoServices
{
    @Autowired
    StudentRepo studentRepo;

    @Autowired
    TeacherRepo teacherRepo;

    @Autowired
    GuardianRepo guardianRepo;

    @Autowired
    CourseRepo courseRepo;

    @Autowired
    BookRepo bookRepo;

    public boolean addStudent(StudentModel newStudent)
    {
        try
        {
            studentRepo.save(newStudent);
            return true;
        }

        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean addTeacher(TeacherModel newTeacher)
    {
        try
        {
            teacherRepo.save(newTeacher);
            return true;
        }

        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean addOrUpdateGuardian(long sId, GuardianModel oldGuardian)
    {
        try
        {
            GuardianModel newGuardian = studentRepo.findById(sId).get().getGuardian();
            newGuardian.setName(oldGuardian.getName());
            newGuardian.setContact(oldGuardian.getContact());
            newGuardian.setRelation(oldGuardian.getRelation());
            guardianRepo.save(newGuardian);
            return true;
        }

        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean assignTeacher(long tId, long sId)
    {
        try
        {
           StudentModel studentModel = studentRepo.findById(sId).get();
           TeacherModel teacherModel = teacherRepo.findById(tId).get();
            List<StudentModel> modelList = teacherModel.getStudents();
            modelList.add(studentModel);
            teacherModel.setStudents(modelList);
            studentModel.setTeacher(teacherModel);
            teacherRepo.save(teacherModel);
            studentRepo.save(studentModel);
            return true;
        }

        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public List<TeacherModel> getAllTeachers()
    {
        return teacherRepo.findAll();
    }

    public GuardianModel getMyGuardian(long sId)
    {
        return studentRepo.findById(sId).get().getGuardian();
    }

    public boolean addBooks(BookModel bookModel)
    {
        try
        {
            bookRepo.save(bookModel);
            return true;
        }

        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean assignBooks(long sId, long bId)
    {
        try
        {
            StudentModel studentModel = studentRepo.findById(sId).get();
            BookModel bookModel = bookRepo.findById(bId).get();
            List<BookModel> list = studentModel.getBooks();
            list.add(bookModel);
            bookModel.setStudent(studentModel);
            studentModel.setBooks(list);
            bookRepo.save(bookModel);
            studentRepo.save(studentModel);
            return true;
        }

        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public List<BookModel> getMyBooks(long sId)
    {
        return studentRepo.findById(sId).get().getBooks();
    }

    public boolean addCourse(CourseModel courseModel)
    {
        try
        {
            Date today = new Date();
            Date start = courseModel.getStartDate();
            Date end = courseModel.getEndDate();

            if(start.compareTo(today) < 0 || start.compareTo(end) >= 0)
            {
                System.out.println("Start Date of the Course must be greater than Current Date & lesser than End Date");
                return false;
            }

            else
            {
                courseRepo.save(courseModel);
                return true;
            }
        }

        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean assignCourse(long sId, long cId)
    {
        try
        {
            StudentModel studentModel = studentRepo.findById(sId).get();
            CourseModel courseModel = courseRepo.findById(cId).get();
            List<CourseModel> list = studentModel.getCourse();
            list.add(courseModel);
            studentModel.setCourse(list);
            studentRepo.save(studentModel);
            return true;
        }

        catch (Exception e)
        {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public List<CourseModel> getMyCourses(long sId)
    {
        return studentRepo.findById(sId).get().getCourse();
    }

    public List<StudentModel> getAllStudents()
    {
        return studentRepo.findAll();
    }

}
