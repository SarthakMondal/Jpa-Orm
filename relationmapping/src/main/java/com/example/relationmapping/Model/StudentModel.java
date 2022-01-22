package com.example.relationmapping.Model;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GeneratorType;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.stereotype.Component;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


@Entity
@Table(name = "student_info")
@EntityListeners(AuditingEntityListener.class)
@JsonIgnoreProperties(value = {"createdAt", "updatedAt"},
        allowGetters = true)
@Component
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class StudentModel
{
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long sId;

    @Column(name = "name")
    private String name;

    @Column(name = "year")
    private String year;

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonBackReference(value = "student-teacher")
    @JoinColumn(name = "teacher_id", referencedColumnName = "id")
    private TeacherModel teacher;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "student_course_info", joinColumns = @JoinColumn(name = "student_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "course_id", referencedColumnName = "id"))
    private List<CourseModel> course;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "student", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference(value = "student-book")
    private List<BookModel> books;

    @OneToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
    @JsonBackReference(value = "student-guardian")
    @JoinColumn(name = "guardian_id", referencedColumnName = "id")
    private GuardianModel guardian;
}
