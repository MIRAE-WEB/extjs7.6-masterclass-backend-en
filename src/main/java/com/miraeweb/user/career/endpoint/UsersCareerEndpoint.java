package com.miraeweb.user.career.endpoint;


import com.miraeweb.user.career.domain.UserCareer;
import com.miraeweb.user.career.domain.result.UserCareerResult;
import com.miraeweb.user.career.service.UserCareerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/users/{userIdx}")
public class UsersCareerEndpoint {


    @Autowired
    private UserCareerService userCareerService;




    @RequestMapping(value="/careers" ,method= RequestMethod.GET)
    public UserCareerResult selectUserCareers(
            @PathVariable("userIdx") Integer userIdx
    ){

        List<UserCareer> listUserCareer = userCareerService.selectList(userIdx);




        return UserCareerResult.builder()
                                .userCareers(listUserCareer)
                                .build();
    }

    @RequestMapping(value="/careers" ,method= RequestMethod.PUT)
    public void modifyUserCareer(
            @PathVariable("userIdx") Integer userIdx,
            @RequestBody List<UserCareer> userCareers
    ){

        userCareerService.modifyUserCareer(userCareers);
    }
}
