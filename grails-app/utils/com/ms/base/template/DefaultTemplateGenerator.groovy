package com.ms.base.template

import com.ms.annotation.MSAction
import com.ms.systemEnum.MSActionType
import com.ms.systemEnum.MSTemplate
import grails.build.logging.GrailsConsole
import groovy.text.SimpleTemplateEngine
import groovy.text.Template
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory
import org.codehaus.groovy.grails.commons.GrailsApplication
import org.codehaus.groovy.grails.commons.GrailsDomainClass
import org.codehaus.groovy.grails.plugins.GrailsPluginInfo
import org.codehaus.groovy.grails.plugins.GrailsPluginManager
import org.codehaus.groovy.grails.plugins.GrailsPluginUtils
import org.codehaus.groovy.grails.plugins.PluginManagerAware
import org.codehaus.groovy.runtime.IOGroovyMethods
import org.codehaus.groovy.runtime.StringGroovyMethods
import org.springframework.context.ResourceLoaderAware
import org.springframework.core.io.AbstractResource
import org.springframework.core.io.FileSystemResource
import org.springframework.core.io.ResourceLoader
import org.springframework.util.Assert
import org.springframework.util.StringUtils

/**
 * Created by zmd on 2016/11/24.
 */
class DefaultTemplateGenerator implements  ResourceLoaderAware, PluginManagerAware {
    protected static final Log log = LogFactory.getLog(DefaultTemplateGenerator.class)
    String basedir = "."
    boolean overwrite = false
    SimpleTemplateEngine engine = new SimpleTemplateEngine()
    protected  ResourceLoader resourceLoader
    protected Template renderEditorTemplate
    protected GrailsPluginManager pluginManager
    protected GrailsApplication grailsApplication
    //用于选择
    protected enum MsGrailsGenerateType {
        DEFAULT,
        RESTFUL,
        ASYNC,
        JOINTABLE,
        TABLEVIEW,
        EDIT
    }
    DefaultTemplateGenerator(ClassLoader classLoader) {
        engine = new SimpleTemplateEngine(classLoader);
    }
    @Override
    void setPluginManager(GrailsPluginManager pluginManager) {
        pluginManager = pluginManager;
    }

    @Override
    void setResourceLoader(ResourceLoader resourceLoader) {
        resourceLoader = resourceLoader;
    }

    public void setGrailsApplication(GrailsApplication ga) {
        grailsApplication = ga
    }

    void generateController(GrailsDomainClass domainClass, String destDir) throws IOException {
        TemplateUtil.vaildField(domainClass)
        generateFile(MsGrailsGenerateType.DEFAULT, domainClass, destDir ,"grails-app/controllers/","groovy",NameUtil.getControllerPackageAndName(domainClass));
    }
    void generateJoinTable(GrailsDomainClass domainClass,GrailsDomainClass domainClass2, String destDir) throws IOException {
        def pkgAName=[NameUtil.getPackage(domainClass),domainClass.shortName+domainClass2.shortName]
        generateFile( MsGrailsGenerateType.JOINTABLE,[domainClass,domainClass2], destDir,"grails-app/domain/","groovy",pkgAName);
    }

    def generateViews(GrailsDomainClass domainClass, String destDir){
        TemplateUtil.vaildField(domainClass)
        def msActionArray =TemplateUtil.getMSAction(domainClass.clazz)
        msActionArray.each{
            try {
                switch (it.actionType()){
                    case [MSActionType.TABLEVIEW ,MSActionType.TABLEVIEWSEARCH]:
                        generateView(MsGrailsGenerateType.TABLEVIEW,it,domainClass,destDir)
                        break
                    case [MSActionType.SAVEORUPDATE]:
                        generateView(MsGrailsGenerateType.EDIT,it,domainClass,destDir)
                        break
                }
            }catch (e){
                log.error("在创建${it}的时候出错",e)
            }

        }
    }

    void generateView(MsGrailsGenerateType mt,MSAction msAction,GrailsDomainClass domainClass, String destDir){
        generateFile(mt, domainClass, destDir ,"grails-app/views/","gsp",NameUtil.getViewerNameAndPackage(msAction,domainClass),[msAction:msAction])
    }


    public void setOverwrite(boolean shouldOverwrite) {
        overwrite = shouldOverwrite;
    }

    public void generateFile(controllerType,  domainClass, String destDir,String url,String type,List<String> pAN,binding=[:]) throws IOException {
        Assert.hasText(destDir, "Argument [destdir] not specified");
        if (domainClass == null) {
            return;
        }
        def destFile = fileWrite(url,destDir,pAN,type);
        if (destFile){
            destFile.getParentFile().mkdirs();
            BufferedWriter writer = null;
            try {
                writer = new BufferedWriter(new FileWriter(destFile));
                generateFile(controllerType, domainClass, writer,pAN,binding);
                try {
                    writer.flush();
                } catch (IOException ignored) {}
            }
            finally {
                IOGroovyMethods.closeQuietly(writer);
            }
        }

        log.info("Controller generated at [" + destFile + "]");
    }
    protected void generateFile( grailsGenerateType,  domainClass, Writer out,List<String> pAN,binding) throws IOException {
        String templateText = null;
        switch (grailsGenerateType) {
            case MsGrailsGenerateType.DEFAULT:
                templateText = getTemplateText("Controller.groovy");
                binding = createBinding(domainClass)
                binding["className"]=domainClass.shortName
                reflectClass(binding)
                binding["importList"]=getImportList(domainClass,binding)
                break;
            case MsGrailsGenerateType.RESTFUL:
                templateText = getTemplateText("RestfulController.groovy")
                break;
            case MsGrailsGenerateType.ASYNC:
                templateText = getTemplateText("AsyncController.groovy")
                break;
            case MsGrailsGenerateType.JOINTABLE:
                templateText = getTemplateText("JoinTable.groovy")
                binding["domainMap"]=createBinding(domainClass[0])
                binding["domainMap2"]=createBinding(domainClass[1])
                break;
            case MsGrailsGenerateType.TABLEVIEW:
                binding<<createBinding(domainClass)
                templateText = getTemplateText("views/tableView.gsp")
                reflectClass(binding)
                break;
            case MsGrailsGenerateType.EDIT:
                binding<<createBinding(domainClass)
                templateText = getTemplateText("views/edit.gsp")
                reflectClass(binding)
                binding["body"]=getFormText("body",domainClass,binding,5)
                binding["commit"]=getFormText("commit",domainClass,binding,4)
                binding["init"]=getFormText("init",domainClass,binding,2)
                binding["importList"]=getImportText(domainClass,binding,0)
                binding["treeDiv"]=getTreeDiv(domainClass,binding,1)
                break;
        }

        binding["packageName"] = pAN[0]
        binding["fileName"] = pAN[1]

        generate(templateText, binding, out);
    }




    protected void generate(String templateText, Map<String, Object> binding, Writer out) {
        try {
            engine.createTemplate(templateText).make(binding).writeTo(out);
        }
        catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
    }



    protected String getTemplateText(String template) throws IOException {
        InputStream inputStream = null;
        AbstractResource templateFile = getTemplateResource(template);
        if (templateFile.exists()) {
            inputStream = templateFile.getInputStream();
        }
        return inputStream == null ? null : IOGroovyMethods.getText(inputStream);
    }

    protected AbstractResource getTemplateResource(String template) throws IOException {
        String name = "src/templates/msbase/" + template;
        AbstractResource templateFile = new FileSystemResource(new File(basedir, name).getAbsoluteFile());
        if (!templateFile.exists()) {
            templateFile = new FileSystemResource(new File(getPluginDir(), name).getAbsoluteFile());
        }

        return templateFile;
    }
    protected  boolean hasTemplateResource(String template){
        String name = "src/templates/msbase/" + template;
        AbstractResource templateFile = new FileSystemResource(new File(basedir, name).getAbsoluteFile());
        if (!templateFile.exists()) {
            templateFile = new FileSystemResource(new File(getPluginDir(), name).getAbsoluteFile());
        }
        templateFile.exists()
    }
    protected File getPluginDir() throws IOException {
        GrailsPluginInfo info = GrailsPluginUtils.getPluginBuildSettings().getPluginInfoForName("msbase");
        return info.getDescriptor().getFile().getParentFile();
    }
//若文件已存在是否覆盖,若能够覆盖返回一个file对象 不行则为空
    protected def fileWrite(url,destDir,pAN,fileType) {
        def destFile = new File(destDir,url+pAN[0].replace('.', '/')+"/"+pAN[1]+"."+fileType);
        if (destFile.exists()) {
            try {
                String relative = makeRelativeIfPossible(destFile.getAbsolutePath(), basedir);
                println("文件:${relative} 已经存在是否重写?, [\"y:确定\", \"n\":取消文件生成, \"a\";新建一个副本文件 ]")
                String response = GrailsConsole.getInstance().userInput("");
                if("a"==response){
                    destFile = new File(destDir,url+pAN[0].replace('.', '/')+"/"+pAN[1]+"副本${new Date().format("yyMMddHHmmss")}."+fileType)
                }else if("n"==response){
                    destFile=null
                }
            }
            catch (Exception e) {
                // failure to read from standard in means we're probably running from an automation tool like a build server
                return destFile;
            }
        }
        return destFile;
    }

    protected String makeRelativeIfPossible(String fileName, String base) throws IOException {
        if (StringUtils.hasLength(base)) {
            fileName = StringGroovyMethods.minus(fileName, new File(base).getCanonicalPath());
        }
        return fileName;
    }

    protected def createBinding(GrailsDomainClass domainClass) {
        def binding =[:]
        binding["pluginManager"] = pluginManager
        binding["domainClass"]=domainClass
        binding["shortName"] = domainClass.getShortName()
        binding["className"] = domainClass.getFullName()
        binding["propertyName"] = domainClass.getPropertyName()
        //binding.put("renderEditor", getRenderEditor());
        return binding;
    }
    private def reflectClass(binding){
        def rfClass =  binding["domainClass"].clazz
        binding["domainName"]=NameUtil.getMSDomainName(rfClass)
        if(!rfClass){
            throw new ClassNotFoundException("reflectClass Error")
        }
        binding["msActionArray"]=TemplateUtil.getMSAction(rfClass)
        rfClass.annotations.each {
            if(it.annotationType() == com.ms.annotation.MSAction){
                binding["msActionArray"]<<it
            }
        }
    }


    private def getImportList(domainClass,binding){
        def msActionArray =binding["msActionArray"]
        def importList=[]
        if(msActionArray*.actionType().findAll{it in MSActionType.getAllExceptViewsAction()}.size()!=msActionArray.size()){
            importList<<"com.ms.base.util.GridDataUtil"
        }
        importList<<"grails.converters.JSON"
        if(binding["packageName"]!=domainClass.getPackageName()){
            importList<<domainClass.getFullName()
        }
        importList
    }
    private def getFormText(path,domainClass,binding,times){
        MSAction msAction =binding["msAction"]
        def sbList =[]
        def fields=msAction.msFileds()
        //给多选树的

        fields.each {
            StringBuffer sb= new StringBuffer()
            MSTemplate msTemplate =TemplateUtil.getMSTemplate(it,domainClass)
            def url = "fields/${path}/${msTemplate.url}.gsp"
            if(hasTemplateResource(url)){
                def fC=TemplateUtil.getFieldByList(it.name().split("\\.") as List,domainClass).referencedPropertyType
                def map=[label:it.label(),name:it.name(),value:it.value(),lastName:NameUtil.nameLast(it.name()),questionMarkName:NameUtil.addQuestionMark(it.name()),propertyName:domainClass.getPropertyName(),controllerName:NameUtil.getViewerPackage(domainClass),domainClass:domainClass,fieldClassName:fC.name]
                def tmpString =engine.createTemplate(getTemplateText(url)).make(map) .toString()
                sb.append(tmpString).append("\n")
                sbList<<TemplateUtil.addTag(times,sb).toString()
            }
        }
        sbList
    }
    private def getImportText(domainClass,binding,times){
        MSAction msAction =binding["msAction"]
        def sbList =[]
        def fields=msAction.msFileds()
        //给多选树的
        def msTemplates=fields.collect {
            StringBuffer sb= new StringBuffer()
            TemplateUtil.getMSTemplate(it,domainClass)
        }.grep().unique()
        msTemplates.each {
            def url = "fields/import/${it.url}.gsp"
            if(hasTemplateResource(url)){
                StringBuffer sb= new StringBuffer()
                def tmpString =engine.createTemplate(getTemplateText(url)).make([:]) .toString()
                sb.append(tmpString).append("\n")
                sbList<<TemplateUtil.addTag(times,sb).toString()
            }
        }
        sbList
    }
    private def getTreeDiv(domainClass,binding,times){
        def treeDiv =new StringBuffer()
        MSAction msAction =binding["msAction"]
        def fields=msAction.msFileds()
        //给多选树的
        fields.each {
            StringBuffer sb= new StringBuffer()
            MSTemplate msTemplate =TemplateUtil.getMSTemplate(it,domainClass)
            def nameLast=NameUtil.nameLast(it.name())
            if((msTemplate==MSTemplate.TREEMULTISELECT)||(msTemplate==MSTemplate.MULTISELECT)){
                def tree=""
                if(msTemplate==MSTemplate.TREEMULTISELECT){
                    tree="Tree"
                }

                def rs=
"""
<div style="display: none; background:#fff; border:1px solid #ccc;">
    <ul id="${nameLast}${tree}" class="ztree"></ul>
</div>\n
"""
                treeDiv.append(rs)
            }
        }
        treeDiv
    }


}
