package com.miraeweb.user.education.endpoint;


import com.miraeweb.user.education.domain.UserEducation;
import com.miraeweb.user.education.domain.result.UserEducationResult;
import com.miraeweb.user.education.service.UserEducationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/users/{userIdx}")
public class UsersEducationEndpoint {


    @Autowired
    private UserEducationService userEducationService;




    @RequestMapping(value="/educations" ,method= RequestMethod.GET)
    public UserEducationResult selectUserEducations(
            @PathVariable("userIdx") Integer userIdx
    ){

        List<UserEducation> listUserEducation = userEducationService.selectList(userIdx);




        return UserEducationResult.builder()
                                .userEducations(listUserEducation)
                                .build();
    }

    @RequestMapping(value="/educations" ,method= RequestMethod.PUT)
    public void modifyUserEducation(
            @PathVariable("userIdx") Integer userIdx,
            @RequestBody List<UserEducation> userEducations
    ){

        userEducationService.modifyUserEducation(userEducations);
    }
}
