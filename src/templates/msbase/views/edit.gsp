 <%
    import com.ms.annotation.MSAction
    import com.ms.annotation.MSField
    import com.ms.base.User
    import com.ms.systemEnum.MSActionType
    import com.ms.base.template.*
    import org.codehaus.groovy.grails.commons.GrailsDomainClass

%>
<!DOCTYPE html>
<html>

<head>
    <title>添加${domainName}</title>
    <meta name="layout" content="dataEdit">
</head>

<body>
<%
    importList.each{
        print it
    }
%>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <g:form url="[action:'${NameUtil.actionName(msAction,domainClass)}',controller:'${NameUtil.getViewerController(domainClass)}']" class="form-horizontal" useToken="true" id="msForm">
					<input type="hidden" name="id" value="\${${propertyName}.id}"  /> 
<%
    body.each{
        print it
    }
%>
                    <div class="form-group">
                        <div class="col-md-10 col-md-offset-2">
                            <button class="btn btn-info" type="button" id="referring">立即提交</button>
                                <button class="btn btn-success" type="reset" style="margin-left:20px;">重&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置</button>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
${treeDiv}
<script type="text/javascript">
    \$(function(){
<%
    init.each{
        print it
    }
%>
        //console.log(parent.tab.draw())
        var msForm = \$("#msForm").validate();
        \$("#referring").click(function(){
            var flag =msForm.formSubmitCheck();
            if(flag){
                var url=\$("#msForm").attr("action");
                var data = \$('#msForm').serialize();
<%
    commit.each{
        print it
    }
%>
                actionAjax(url,data,success);
                function success(data){
                    if(data.result){
                        ms.msg("成功",1,1000);//成功  1   失败 2
                        setTimeout(function(){
                            parent.tab.draw(false); //刷新父页面
                            var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                            parent.layer.close(index);  // 关闭layer
                        },1000);
                    }else{
                        ms.msg("失败",2,2000);//成功  1   失败 2
                    }
                }
            }

        });
    });
</script>
</body>
</html>
