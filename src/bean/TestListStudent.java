package bean;

import java.io.Serializable;

public class TestListStudent implements Serializable {
    /**
     * 学生番号:String
     */
    private String studentNo;

    /**
     * 学生名:String
     */
    private String studentName;

    /**
     * 入学年度:int
     */
    private int entranceYear;

    /**
     * クラス:String
     */
    private String classNum;

    /**
     * 科目名:String
     */
    private String subjectName;

    /**
     * 科目コード:String
     */
    private String subjectCd;

    /**
     * 回数:int
     */
    private int num;

    /**
     * 得点:int
     */
    private int point;

    /**
     * ゲッター、セッター
     */
    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getEntranceYear() {
        return entranceYear;
    }

    public void setEntranceYear(int entranceYear) {
        this.entranceYear = entranceYear;
    }

    public String getClassNum() {
        return classNum;
    }

    public void setClassNum(String classNum) {
        this.classNum = classNum;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getSubjectCd() {
        return subjectCd;
    }

    public void setSubjectCd(String subjectCd) {
        this.subjectCd = subjectCd;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }
}