package com.example.relationmapping.Repo;
import com.example.relationmapping.Model.TeacherModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TeacherRepo extends JpaRepository<TeacherModel, Long>
{
}
