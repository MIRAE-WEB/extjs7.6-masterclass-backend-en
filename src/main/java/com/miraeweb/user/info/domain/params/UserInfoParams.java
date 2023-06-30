package com.miraeweb.user.info.domain.params;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserInfoParams {

    private String searchTxt;
    private Integer start;
    private Integer limit;
}
