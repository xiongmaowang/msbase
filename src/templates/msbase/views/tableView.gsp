
<%
import com.ms.annotation.MSAction
import com.ms.annotation.MSField
import com.ms.base.User
import com.ms.systemEnum.MSActionType
import com.ms.base.template.*
import org.codehaus.groovy.grails.commons.GrailsDomainClass
%>
<%
    def  multiSelect=false
    def actionList =[]
    def deleteList =[]
    def addList =[]
    msActionArray.each{
        def url= "\"\${request.getContextPath()}/${com.ms.base.template.NameUtil.getViewerController(domainClass)}/${com.ms.base.template.NameUtil.actionName(it,domainClass)}\""
        def actionUrl= "createLink(controller:'${NameUtil.getViewerController(domainClass)}',action:'${NameUtil.actionName(it,domainClass)}')"
        switch (it.actionType()){
            case MSActionType.SAVEORUPDATE:
                url="\"\${request.getContextPath()}/${NameUtil.getViewerController(domainClass)}/${NameUtil.actionName(it,domainClass)+'View'}\""
                actionUrl= "createLink(controller:'${NameUtil.getViewerController(domainClass)}',action:'${NameUtil.actionName(it,domainClass)+"View"}')"
                actionList<<[action:"'编辑'",class:"'edit'",url:actionUrl]
                addList<<[action:"新增"+NameUtil.getMSDomainName(domainClass.clazz),label:"新增"+NameUtil.getMSDomainName(domainClass.clazz),class:"btn btn-success btn-block add-button",spanClass:"fa fa-plus",url:url]
                break
            case MSActionType.CHANGEOFSTATE:
                def actionName=""
                for (def label:it.msFileds()*.label()){
                    if(label){
                        actionName=label
                        break
                    }
                }
                actionList<<[action:actionName?"'${actionName}'":"'修改状态'",class:"'del'",url:actionUrl]
                deleteList<<[action:"批量"+(actionName?actionName:"修改状态"),label:actionName?actionName:"修改状态",class:"btn btn-danger btn-block batch-del",spanClass:"fa fa-edit",url:url]
                multiSelect=true
                break
            case MSActionType.DELETE:
                actionList<<[action:"'删除'",class:"'del'",url:actionUrl]
                deleteList<<[action:"批量删除",label:"删除",class:"btn btn-danger btn-block batch-del",spanClass:"fa fa-edit",url:url]
                multiSelect=true
                break
            case MSActionType.TABLEVIEW:
                break
            case MSActionType.TABLEVIEWSEARCH:
                break
        }
    }
    deleteList+=addList
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="dataTable">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content" tableId="msTable" >
                    <div class="form-inline" role="form">
                        <div class="row">
                            <%if(msAction.actionType()==com.ms.systemEnum.MSActionType.TABLEVIEWSEARCH){%>
                            <!--搜索条件-->
                            <form>
                            <div class="col-md-9">
                                <div class="row user_div">
                                    <%    msAction.msFileds().each{
                                    %>
                                    <div class="col-md-4 col-sm-4">
                                        <label style="width:100px;">${it.label()?it.label():it.name()}:</label>
<%print TemplateUtil.switchSearchInput(it,TemplateUtil.getFieldByList(it.name().split("\\.") as List,domainClass),it.name(),it.label()?it.label():it.name()) %>
                                    </div>
                                    <%}%>
                                    <div class="col-md-4 col-sm-12 pull-right">
                                        <div class="row">
                                            <div class="col-md-8" style="padding:0;">
                                                <div class="col-sm-6">
                                                    <button class="btn btn-info btn-block search-button" type="button"  name="mySearch" id="mySearch">搜索</button>
                                                </div>
                                                <div class="col-sm-6">
                                                    <button class="btn btn-primary btn-block" type="reset">重置</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>
                                 <%}%>
                            <%if(deleteList){%>
                            <div class="${msAction.actionType()==com.ms.systemEnum.MSActionType.TABLEVIEWSEARCH?"col-md-3 col-sm-12":"col-lg-2 col-md-4 col-sm-12 pull-right"}">
                                <div class="row" >
                                <%deleteList.eachWithIndex {it,i->%>
                                    <div class="col-md-6 col-sm-12">
                                        <button class="${it.class}" url=${it.url} label="${it.label}">
                                            <span class="${it.spanClass}"></span>
                                            ${it.action}
                                        </button>
                                    </div>
                                <%}%>
                                </div>
                            </div>
                        <%}%>
                        </div>
                    </div>
                    <!--列表页面-->
                    <ms:dataTable domainClass="\${domainClass}" id="msTable" multiSelect="${multiSelect}" orderNumber="true" actionList="${actionList}" serverSide="true" defaultScript="false" />
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 自定义js -->
<!-- Page-Level Scripts -->
<script>
    (function(win,doc,\$,lay){
        //datatable 配置
        \$(doc).ready( function() {
            var tableId="msTable"
            var dataobj=eval("dataObj"+tableId)
             tab=\$('#'+tableId).DataTable( {
                "columns":dataobj.columns,
                "order" :dataobj.defaultSort,
                "processing": true ,
                "serverSide": dataobj.serverSide,
                //控制dataTable的布局
                dom: 'lrtip',
                /*autoWidth: false,
                 scrollX: true,*/
                autoWidth :true,
                "ajax":  {
                    "url": "<g:createLink controller="${NameUtil.getViewerController(domainClass)}" action="${NameUtil.actionName(msAction,domainClass)}" />.json",
                    "type": "POST",
                    "data": function ( d ) {
                        return {
                            'tableData':JSON.stringify(d),
                            'ajaxData' :dataobj.ajaxData
                        };
                    }
                }
            })
                    dataTablesInit(tab);

         } );
    })(window,document,jQuery,layer);

</script>
</body>
</html>



