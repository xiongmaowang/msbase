package com.ms.annotation;

import java.lang.annotation.*;

@Target({ ElementType.FIELD, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface GridColumn {
	//数据列表标题
	String name() ;
	//排序
	int colIdx()  default 100;
	//是否显示 默认为true
	boolean visible() default true;
	//允许dataTable返回值为null,如果为null那么会附上默认值
	String defaultContent() default  "";
	//是否允许该列去排序 默认为true ,如果该注解用于修饰方法并且orderTarget值为空的话 则为false
	boolean orderable() default true;
	//用于修饰方法时指定排序和搜索的依据 支持"depart.name"这样的写法 ,
	String target() default "";
	//是否为默认的排序标准
	boolean defaultOrder() default false;
	//默认的排序标准的   desc , asc
	String defaultOrderType() default "desc";
	//多条件排序时候的顺序
	int defaultOrderIndex() default  100;
	//是否允许搜索
	boolean searchable() default  true;
	//不允许应用的tableId
	String[] unusableTableIds()  default {} ;
	//是否转义, 默认为true 如果在返回值里写了html代码则用false
	boolean htmlEncode()  default true;
	//宽度
	String width() default  "";

	//点击该列排序的时候 实际是根据哪几个类进行排序的
	String[] orderData() default  {};
	//仅用于排序和搜索
	String orderDataType() default  "";
	//改变点击排序的时候的排序规则 比如['desc','asc','asc'] 就代表每3次点击的排序规则为 降序->升序->升序
	String[] orderSequence() default  {};

	String className() default  "";

	String cellType() default  "";

	String contentPadding() default  "";
	//函数
	String createdCell() default  "";

	String type() default  "string";


}