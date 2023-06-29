package com.miraeweb.user.education.domain.result;

import com.miraeweb.user.education.domain.UserEducation;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Builder
@Data
public class UserEducationResult {
    private List<UserEducation> userEducations;
}
