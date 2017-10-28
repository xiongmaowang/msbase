package com.ms.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * Created by zmd on 2016/12/1.
 */
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface MSActions {
    MSAction[] msAction();
}
