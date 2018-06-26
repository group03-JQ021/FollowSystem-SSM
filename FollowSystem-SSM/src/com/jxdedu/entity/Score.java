package com.jxdedu.entity;


/**
 * 学员成绩表, 每个学员,每门课程只记录最终成绩;
 * 课程成绩位取值范围为 [0, 100]
 * @ClassName Score
 * @author 陈希展 
 * @date 2018年6月13日
 */
public class Score {

    private int stuId;      // 学生id
    private int courseId;   // 课程id
    private int score;      // 学生成绩
    Course course;

    public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}



    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    public String toString() {
        return "成绩 [学号:" + stuId + ", 课程号:" + courseId + ", 成绩:" + score + "]";
    }
    
    

	public Score(int stuId, int courseId, int score, Course course) {
		super();
		this.stuId = stuId;
		this.courseId = courseId;
		this.score = score;
		this.course = course;
	}

	public Score() { 
		
	}

	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}


    
}
