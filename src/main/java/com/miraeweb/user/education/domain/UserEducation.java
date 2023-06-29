package com.miraeweb.user.education.domain;

import lombok.Data;

@Data
public class UserEducation {


    private String flag; // I: 추가 , U : 수정 , D: 삭제

    private Integer userEducationIdx;	// Idx
    private Integer userIdx;	// UserIdx
    private String institution;	// 학교명
    private String major;	// 학과(전공)
    private String degreeCode;	// 학위
    private String graduationCode;	// 상태
    private String yearOfGraduation;	// 졸업(예정)년도
}
