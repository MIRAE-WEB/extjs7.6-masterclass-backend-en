package com.miraeweb.user.info.endpoint;


import com.miraeweb.user.info.domain.UserInfo;
import com.miraeweb.user.info.domain.params.UserInfoParams;
import com.miraeweb.user.info.domain.result.UserInfoResult;
import com.miraeweb.user.info.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/users")
public class UserInfoEndpoint {


    @Autowired
    private UserInfoService userInfoService;


    @RequestMapping(value="" ,method= RequestMethod.GET)
    public UserInfoResult selectUsers(
            @RequestParam(value = "searchTxt" ,required = false) String searchTxt
    ){

        UserInfoParams userInfoParams = UserInfoParams.builder()
                .searchTxt(searchTxt)
                .build();

        return userInfoService.selectUsers(userInfoParams);
    }
    @RequestMapping(value="" ,method= RequestMethod.POST)
    public void insertUsers(
            @RequestBody UserInfo userInfo

    ){
        userInfoService.insert(userInfo);
    }
    @RequestMapping(value="/{userIdx}" ,method= RequestMethod.PUT)
    public void updateUsers(
            @RequestBody UserInfo userInfo
    ){

        userInfoService.update(userInfo);
    }
    @RequestMapping(value="/{userIdx}" ,method= RequestMethod.DELETE)
    public void removeUsers(
            @PathVariable("userIdx") Integer userIdx
    ){
        userInfoService.remove(userIdx);
    }
}
