package com.miraeweb.user.info.domain;

import lombok.Data;

@Data
public class UserInfo {

    private Integer userIdx;	// UserIdx(PK)
    private String userId;	// 사용자ID
    private Integer saltKey;	// SaltKey
    private String password;	// 비밀번호
    private String userName;	// 사용자명
    private String mobile;	// 핸드폰
    private String email;	// 이메일
    private String birthDate;	// 생년월일
    private String genderCode;	// 성별
    private String zipCode;	// 우편번호
    private String address1;	// 주소1
    private String address2;	// 주소2
    private String bankCode;	// 은행코드
    private String bankAccount;	// 은행계좌
    private Integer bankAccountFileId;	// 은행계좌
    private String ownerName;	// 예금주
    private String deptCode;	// 부서코드
    private String rankCode;	// 직급
    private String employeeNumber;	// 사번
}
