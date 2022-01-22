package com.example.relationmapping.Controller;

import com.example.relationmapping.Model.*;
import com.example.relationmapping.Service.DaoServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/backend")
public class RestApis
{
    @Autowired
    DaoServices daoServices;

    @PostMapping(path = "/addstudent")
    public boolean addStudent(@RequestBody StudentModel studentModel)
    {
        return this.daoServices.addStudent(studentModel);
    }

    @PostMapping(path = "/addteacher")
    public boolean addTeacher(@RequestBody TeacherModel teacherModel)
    {
        return this.daoServices.addTeacher(teacherModel);
    }

    @PutMapping(path = "/addorupdateguardian/{sId}")
    public boolean addORUpdateGuardian(@PathVariable String sId, @RequestBody GuardianModel guardianModel)
    {
        return this.daoServices.addOrUpdateGuardian(Long.parseLong(sId), guardianModel);
    }

    @PostMapping(path = "/assignteacher/{tId}/{sId}")
    public boolean assignTeacher(@PathVariable String tId, @PathVariable String sId)
    {
        return this.daoServices.assignTeacher(Long.parseLong(tId), Long.parseLong(sId));
    }

    @GetMapping(path = "/getteachers")
    public List<TeacherModel> getAllTeachers()
    {
        return this.daoServices.getAllTeachers();
    }

    @GetMapping(path = "/getmyguardian/{sId}")
    public GuardianModel getMyGuardian(@PathVariable String sId)
    {
        return this.daoServices.getMyGuardian(Long.parseLong(sId));
    }

    @PostMapping(path = "/addbook")
    public boolean addBooks(@RequestBody  BookModel bookModel)
    {
        return this.daoServices.addBooks(bookModel);
    }

    @PostMapping(path = "/assignbook/{sId}/{bId}")
    public boolean assignBooks(@PathVariable String sId, @PathVariable String bId)
    {
        return this.daoServices.assignBooks(Long.parseLong(sId), Long.parseLong(bId));
    }

    @GetMapping(path = "/getmybooks/{sId}")
    public List<BookModel> getMyBooks(@PathVariable String sId)
    {
        return this.daoServices.getMyBooks(Long.parseLong(sId));
    }

    @GetMapping(path = "/getstudents")
    public List<StudentModel> getAllStudents()
    {
        return this.daoServices.getAllStudents();
    }

    @PostMapping(path = "/addcourse")
    public boolean addCourse(@RequestBody CourseModel courseModel)
    {
        return this.daoServices.addCourse(courseModel);
    }

    @PostMapping(path = "/assigncourse/{sId}/{cId}")
    public boolean assignCourse(@PathVariable String sId, @PathVariable String cId)
    {
        return this.daoServices.assignCourse(Long.parseLong(sId), Long.parseLong(cId));
    }

    @GetMapping(path = "/getmycourses/{sId}")
    public List<CourseModel> getMyCourses(@PathVariable String sId)
    {
        return this.daoServices.getMyCourses(Long.parseLong(sId));
    }
}
