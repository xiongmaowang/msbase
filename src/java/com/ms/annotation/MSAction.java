package com.ms.annotation;


import com.ms.systemEnum.MSActionType;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * Created by zmd on 2016/11/24.
 */
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface MSAction {
    //动作类型
    MSActionType actionType() ;
    //动作名(方法名)
    String actionName() default "" ;
    //编辑页面参数配置
    MSField []  msFileds() default {};
}
