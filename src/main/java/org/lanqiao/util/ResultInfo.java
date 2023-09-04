package org.lanqiao.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * @author chenrui
 * @version 1.0
 * @data 2023/9/4 下午2:50
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class ResultInfo {
    private String status;
    private String message;
    private Object data;

    public ResultInfo(String status, String message){
        this.status = status;
        this.message = message;
    }

}
