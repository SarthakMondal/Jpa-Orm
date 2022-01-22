package com.example.relationmapping.Repo;
import com.example.relationmapping.Model.BookModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepo extends JpaRepository<BookModel, Long>
{
}
