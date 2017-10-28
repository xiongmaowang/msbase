grails.servlet.version = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.work.dir = "target/work"
grails.project.target.level = 1.7
grails.project.source.level = 1.7
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.fork = [
        // configure settings for compilation JVM, note that if you alter the Groovy version forked compilation is required
        //  compile: [maxMemory: 256, minMemory: 64, debug: false, maxPerm: 256, daemon:true],

        // configure settings for the test-base JVM, uses the daemon by default
        test: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, daemon:true],
        // configure settings for the run-base JVM
        run: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
        // configure settings for the run-war JVM
        war: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
        // configure settings for the Console UI JVM
        console: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256]
]

grails.project.dependency.resolver = "maven" // or ivy
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        mavenLocal()
        grailsCentral()
        mavenCentral()
        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
        mavenRepo "http://repo.grails.org/grails/plugins/"
        mavenRepo "http://repo.spring.io/milestone/"
        mavenRepo "https://maven.alfresco.com/nexus/content/groups/public/"
        mavenRepo "http://repo.grails.org/grails/core"
        mavenRepo "http://192.168.0.253:8081/nexus/content/repositories/thirdparty"
        //用于Jchronic这个时间转换插件
        mavenRepo "https://mvnrepository.com/artifact/com.rubiconproject.oss/jchronic"
    }

    dependencies {
        runtime ('mysql:mysql-connector-java:5.1.6')/*
        compile ('com.sdicons.jsontools:jsontools-core:1.7',
                'commons-httpclient:commons-httpclient:3.0.1',
                'commons-beanutils:commons-beanutils:1.9.2',
                'javax.validation:validation-api:1.1.0.Final')
        //freemarker jar
        compile "org.grails.plugins:freemarker:2.3.19"
        //BASE64 apache提供的
        compile 'commons-codec:commons-codec:1.10'
        compile 'org.grails.plugins:core-renderer:1.0'
        compile 'org.grails.plugins:iText:2.0.8'
        compile 'org.grails.plugins:iTextAsian:1.0'*/
        //时间转化插件
        compile "com.rubiconproject.oss:jchronic:0.2.6"
    }

    plugins {
        // plugins for the build system only
        build ":tomcat:7.0.55.3" // or ":tomcat:8.0.22"

        // plugins for the compile step
       // compile ":scaffolding:2.1.2"
        compile ':cache:1.1.8'
        // asset-pipeline 2.0+ requires Java 7, use version 1.9.x with Java 6
        compile ":asset-pipeline:2.12.10"
        compile ":spring-security-core:2.0.0"
		
		//compile "org.grails.plugins:msueditor:0.3" //":ueditor:1.4.3"
        // plugins needed at runtime but not for compilation
        runtime ":hibernate4:4.3.10" // or ":hibernate:3.6.10.18"
        runtime ":database-migration:1.4.0"
        // Uncomment these to enable additional asset-pipeline capabilities
        //compile ":sass-asset-pipeline:1.9.0"
        //compile ":less-asset-pipeline:1.10.0"
        //compile ":coffee-asset-pipeline:1.8.0"
        //compile ":handlebars-asset-pipeline:1.3.0.3"
    }
}
