package com.example.wcd_exam;

public class Student {
    private int id;
    private String name;
    private double examScores;
    private String imageUrl;



    public Student(int id, String name, double examScores,String imageUrl) {
        this.id = id;
        this.name = name;
        this.examScores = examScores;
        this.imageUrl = imageUrl;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getExamScores() {
        return examScores;
    }

    public void setExamScores(double examScores) {
        this.examScores = examScores;
    }
}
