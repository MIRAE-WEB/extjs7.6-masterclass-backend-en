package com.miraeweb.user.info.domain.params;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class UserInfoParams {

    private Integer start;
    private Integer limit;
}
