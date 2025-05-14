package bean;

public class Bean {
    // 学生情報
    private int student_id;
    private String student_name;

    // クラス情報
    private int class_id;
    private String class_name;

    // 学校情報
    private int school_id;
    private String school_name;

    // 教科情報
    private int subject_id;
    private String subject_name;

    // 教師情報
    private int teacher_id;
    private String teacher_name;

    // 成績情報
    private int score_id;
    private int score_value;

    // 合計・平均
    private int score_sum;
    private double score_avg;

    // Getter & Setter
    public int getStudent_id() {
        return student_id;
    }
    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public String getStudent_name() {
        return student_name;
    }
    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public int getClass_id() {
        return class_id;
    }
    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public String getClass_name() {
        return class_name;
    }
    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public int getSchool_id() {
        return school_id;
    }
    public void setSchool_id(int school_id) {
        this.school_id = school_id;
    }

    public String getSchool_name() {
        return school_name;
    }
    public void setSchool_name(String school_name) {
        this.school_name = school_name;
    }

    public int getSubject_id() {
        return subject_id;
    }
    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public String getSubject_name() {
        return subject_name;
    }
    public void setSubject_name(String subject_name) {
        this.subject_name = subject_name;
    }

    public int getTeacher_id() {
        return teacher_id;
    }
    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getTeacher_name() {
        return teacher_name;
    }
    public void setTeacher_name(String teacher_name) {
        this.teacher_name = teacher_name;
    }

    public int getScore_id() {
        return score_id;
    }
    public void setScore_id(int score_id) {
        this.score_id = score_id;
    }

    public int getScore_value() {
        return score_value;
    }
    public void setScore_value(int score_value) {
        this.score_value = score_value;
    }

    public int getScore_sum() {
        return score_sum;
    }
    public void setScore_sum(int score_sum) {
        this.score_sum = score_sum;
    }

    public double getScore_avg() {
        return score_avg;
    }
    public void setScore_avg(double score_avg) {
        this.score_avg = score_avg;
    }
}
