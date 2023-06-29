package com.miraeweb.user.career.domain;

import lombok.Data;

@Data
public class UserCareer {

    private String flag; // I: 추가 , U : 수정 , D: 삭제
    private Integer userCareerIdx;	// Idx
    private Integer userIdx;	// UserIdx
    private String company;	// 회사명
    private String employeeStateCode;	// 재직상태
    private String rank;	// 직급
    private String careerStartDate;	// 입사일
    private String careerEndDate;	// 퇴사일
    private Integer evidanceFileProp;	// 첨부파일
}
