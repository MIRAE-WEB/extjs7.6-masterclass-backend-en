package com.miraeweb.user.career.domain.result;

import com.miraeweb.user.career.domain.UserCareer;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Builder
@Data
public class UserCareerResult {
    private List<UserCareer> userCareers;
}
