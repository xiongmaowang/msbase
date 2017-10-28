// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }
def springSecurityService
grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
//assets
grails.assets.excludes = ["**/*.less"]
grails.assets.minifyJs = false

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ // the first one is the default format
                      all:           '*/*', // 'all' maps to '*' or the first available format in withFormat
                      atom:          'application/atom+xml',
                      css:           'text/css',
                      csv:           'text/csv',
                      form:          'application/x-www-form-urlencoded',
                      html:          ['text/html','application/xhtml+xml'],
                      js:            'text/javascript',
                      json:          ['application/json', 'text/json'],
                      multipartForm: 'multipart/form-data',
                      rss:           'application/rss+xml',
                      text:          'text/plain',
                      hal:           ['application/hal+json','application/hal+xml'],
                      xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// Legacy setting for codec used to encode data with ${}
//等于将所有${value}→${value.encodeAsHTML()}
grails.views.default.codec = "html"

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        // filteringCodecForContentType.'text/html' = 'html'
    }
}


grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

// configure passing transaction's read-only attribute to Hibernate session, queries and criterias
// set "singleSession = false" OSIV mode in hibernate configuration after enabling
grails.hibernate.pass.readonly = false
// configure passing read-only to OSIV session by default, requires "singleSession = false" OSIV mode
grails.hibernate.osiv.readonly = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        grails.config.locations = ["classpath:datasource_pro.properties"] //mysql
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    /*error  'org.codehaus.groovy.grails.web.servlet',        // controllers
    'org.codehaus.groovy.grails.web.pages',          // GSP
    'org.codehaus.groovy.grails.web.sitemesh',       // layouts
    'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
    'org.codehaus.groovy.grails.web.mapping',        // URL mapping
    'org.codehaus.groovy.grails.commons',            // core / classloading
    'org.codehaus.groovy.grails.plugins',            // plugins
    'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
    'org.springframework',
    'org.hibernate',
    'net.sf.ehcache.hibernate'*/

    environments {
        development {

            appenders {
                console name:'stdout', layout:pattern(conversionPattern: "[%d{HH:mm:ss:SSS}] %-5p %c{2}: %m%n")
            }

            root { warn 'stdout' }
        }
        test {
            appenders {
                appender new org.apache.log4j.DailyRollingFileAppender(name:"dailyAppender",layout:pattern(conversionPattern: "[%d{HH:mm:ss:SSS}] %-5p %c{2}: %m%n"),fileName:"d:\\log\\grails.log",datePattern:"'.'yyyy-MM-dd")
            }
            root{
                warn 'dailyAppender'
                additivity = true
            }


        }

        production {
            appenders {
                appender new org.apache.log4j.DailyRollingFileAppender(name:"dailyAppender",layout:pattern(conversionPattern: "[%d{HH:mm:ss:SSS}] %-5p %c{2}: %m%n"),fileName:"d:\\log\\grails.log",datePattern:"'.'yyyy-MM-dd")
            }
            root{
                error 'dailyAppender'
                additivity = true
            }


        }
    }

}
//grails 数据绑定时 对日期进行自动转换
grails.databinding.dateFormats = ['yyyy-MM-dd', 'yyyy-MM-dd HH:mm','EEE MMM dd yyyy HH:mm:ss \'GMT\'Z']
grails.gorm.default.constraints = {
    '*'(nullable: true,blank:true)
}
grails.gorm.default.mapping = {
    //如果是xx.ms包下的 将会提供格式化的table名和 id类型
    def classNameArray=className.split("\\.")
    if(classNameArray.length>2){
        if(classNameArray[1]=="ms"){
            id generator:'uuid.hex',params:[separator:'-'], column: 'pId' ,type : 'string'
        }
    }
    table Config.formateClassName(className)

}
//hibernate配置
beans {
    cacheManager {
        shared = true
    }
}


//富文本获取图片路径
grails.ueditor.serverURL = "${appName}"
//富文本图片上传路径
grails.ueditor.realPath = "D:/ueditor/images/"

//---------------------------------------------------浏览文件上传路径 ----------------------------------------------------
msFileConfig {
    fileUploadPath="D:/"
}
ms.databaseType="mysql"
grails.plugin.springsecurity.apf.postOnly = "false"
// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.ms.base.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.ms.base.UserResource'
grails.plugin.springsecurity.authority.className = 'com.ms.base.Resource'
grails.plugin.springsecurity.authority.nameField = 'authority'
grails.plugin.springsecurity.requestMap.className = 'com.ms.base.Requestmap'
grails.plugin.springsecurity.requestMap.urlField = 'url'
grails.plugin.springsecurity.requestMap.configAttributeField = 'configAttribute'
grails.plugin.springsecurity.requestMap.httpMethodField = 'httpMethod'

grails.plugin.springsecurity.securityConfigType = "Requestmap"




//增加缓存机制--------------------------------------------------------------------
grails.plugin.springsecurity.rememberMe.cookieName='ms_remember_me'
grails.plugin.springsecurity.rememberMe.alwaysRemember=true
grails.plugin.springsecurity.rememberMe.tokenValiditySeconds=31*24*60*60	//一个月
grails.plugin.springsecurity.rememberMe.parameter='_spring_security_remember_me'
grails.plugin.springsecurity.rememberMe.key='ms_ms'
grails.plugin.springsecurity.rememberMe.useSecureCookie=false
grails.plugin.springsecurity.rememberMe.persistent=false

//groovy方法--------------------------------------------------------------------
static def formateClassName(className){
    char[] charArray=className.substring((className.lastIndexOf('.')+1)).trim().toCharArray()
    def tableArray=[]
    for (int i=0;i<charArray.length;i++) {
        if(charArray[i].isUpperCase()&&i>0){
            tableArray<<'_'
        }
        tableArray<<charArray[i]
    }
    def tableName=(char[])tableArray
    "TB_"+tableName.toString()
}