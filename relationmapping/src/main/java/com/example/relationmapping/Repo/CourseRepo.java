package com.example.relationmapping.Repo;
import com.example.relationmapping.Model.CourseModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CourseRepo extends JpaRepository<CourseModel, Long>
{
}
