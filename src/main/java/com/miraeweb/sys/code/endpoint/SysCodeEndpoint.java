package com.miraeweb.sys.code.endpoint;

import com.miraeweb.sys.code.domain.SysCode;
import com.miraeweb.sys.code.result.SysCodeResult;
import com.miraeweb.sys.code.service.SysCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@RestController

// sys/codes/BANK_CODE
@RequestMapping("/sys/codes/{preCode}")
public class SysCodeEndpoint {

    @Autowired
    private SysCodeService sysCodeService;
    @RequestMapping(value="", method= RequestMethod.GET)
    public SysCodeResult selectPreCode(
            @PathVariable("preCode") String preCode
    ){


        List<SysCode> listSysCode = sysCodeService.selectPreCode(preCode);
        Map<String, List<SysCode>> sysCodeMap = new HashMap<>();
        sysCodeMap.put(preCode,listSysCode);

        return SysCodeResult.builder()
                .sysCodes(sysCodeMap)
                .build();
    }
}
