package com.example.relationmapping.Repo;
import com.example.relationmapping.Model.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentRepo extends JpaRepository<StudentModel, Long>
{
    @Query(value = "SELECT `course_info`.`name` as `course_name`, `course_info`.`start_date`, `course_info`.`end_date` FROM `student_info` JOIN `student_course_info` ON `student_info`.`id` = `student_course_info`.`student_id` JOIN `course_info` ON `course_info`.`id` = `student_course_info`.`course_id` WHERE `student_info`.`id` = :sId", nativeQuery = true)
    List<List<String>> getCourseData(long sId);
}
