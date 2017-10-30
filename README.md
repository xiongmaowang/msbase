# msbase
Grails 基础平台项目

## 运行环境
jdk1.7, groovy 2.4.10 ,grails 2.5.4

## 项目功能
根据domain里的注解配置动作和页面显示类型.使用脚本生成控制器和相应页面代码.
生成命令:  
ms-generate-controller +domain类的路径(包名+domain类类名):生成控制器  
ms-generate-view +domain类的路径	:生成页面  
ms-generate-all +domain类的路径  :生成页面+控制器   
create-domain-class +domain类的路径 :生成domain类
## 例子
1. 运行grails 命令 create-domain-class com.ms.test.testA 创建domain类
2. 在 domain类中添加需要的属性,和相应的注解(TestP是另外一个domain类) 
        
        @MSActions(msAction = [
            @MSAction(actionType = MSActionType.SAVEORUPDATE ,msFileds = [
                    @MSField(name = "testAName",label="testAName"  ),
                    @MSField(name = "testP.testPName",label="testPName"  ),
                    @MSField(name = "testP.testPInt",label="testPInt"  ),
                    //@MSField(name = "testP.testCs",label="testCs"  )
            ]),
            @MSAction(actionType = MSActionType.DELETE  ),
            @MSAction(actionType = MSActionType.TABLEVIEWSEARCH ,msFileds = [
                    @MSField(name = "testP",label="testPName" ),
            ])
        ])
        @MSDomain(name = "A",controllerPackage = "com.ms.test",viewPackage = "com/ms/test")
        class TestA {
            def springSecurityService
            static transients = ["springSecurityService"]
            String id
            @GridColumn(name = "testAName")
            String testAName
            @GridColumn(name = "testP",visible = false)
            TestP testP
            @GridColumn(name = "testPName",target = "testP.testPName")
            def getTestPName(){
                testP?testP.testPName:""
            }
            //创建日期
            Date dateCreated
            Date lastUpdated
            User userCreated
            User userUpdated
        }

3.运行 grails 命令 ms-generate-all com.ms.test.testA 在controllers文件夹中生成一个com.ms.test.TestAController,和views文件夹下的com/ms/test中生成一个编辑页面 和一个列表页面

4.生成列表页面和 编辑保存页面如下
![image](http://note.youdao.com/yws/public/resource/408aea5707200ed0f1ff352e5f5579b8/xmlnote/AE818D289E5D40F08DF67A54B4C21DFE/19963) 
![image](http://note.youdao.com/yws/public/resource/408aea5707200ed0f1ff352e5f5579b8/xmlnote/8E5BE4B3DC5840979EA4BDD355E813A9/19968) 