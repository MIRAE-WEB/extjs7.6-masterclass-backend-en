package com.miraeweb.sys.code.domain;

import lombok.Data;

@Data
public class SysCode {

    private Integer codeIdx;	//
    private String preCode;	// 코드그룹
    private String code;	// 코드
    private String codeName;	// 코드명
    private Integer sort;	// 정렬순서
}
