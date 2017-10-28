package com.ms.annotation;

import com.ms.systemEnum.MSTemplate;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * Created by zmd on 2016/11/23.
 */
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface MSField {
    //字段名
    String name() ;
    //字段的显示名称
    String label() default "";
    //仅用于修改属性值的动作
    String value() default "";
    //编辑页面类型
    MSTemplate msTemplate () default  MSTemplate.DEFAULT;

}
