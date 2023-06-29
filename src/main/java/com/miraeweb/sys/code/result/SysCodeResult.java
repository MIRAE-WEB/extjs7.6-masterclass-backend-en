package com.miraeweb.sys.code.result;

import com.miraeweb.sys.code.domain.SysCode;
import lombok.Builder;
import lombok.Data;

import java.util.List;
import java.util.Map;

@Builder
@Data
public class SysCodeResult {
    Map<String, List<SysCode>> sysCodes;
}
