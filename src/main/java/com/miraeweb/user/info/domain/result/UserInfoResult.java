package com.miraeweb.user.info.domain.result;

import com.miraeweb.user.info.domain.UserInfo;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Builder
@Data
public class UserInfoResult {



    private List<UserInfo> users;
    private Integer totalCount;
}
