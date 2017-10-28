package com.ms.annotation;

import java.lang.annotation.*;

/**
 * Created by zmd on 2016/11/29.
 * 用于对domain类的描述
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface MSDomain {
    //对该类进行描述时的名称
    String name();
    //生成的控制器名称 例如: userTest会生成 UserTestController
    String controllerName() default "";
    //生成的控制器的包名
    String controllerPackage() default "";
    //生成的页面的包名
    String viewPackage() default "";
}
