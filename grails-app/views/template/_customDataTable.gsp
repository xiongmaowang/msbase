<%@page expressionCodec="none" %>
<table ${tableField}>
    <thead>
    <tr>
        <g:if test="${multiSelect}">
        %{--style="width:20px;text-align: center;"--}%
            <th><input type="checkbox" class="userList_check_control"></th>
        </g:if>
        <g:if test="${orderNumber}">
            <th>序列</th>
        </g:if>
        <g:each in="${customTable}">
            <th>${it.name}</th>
        </g:each>
        <g:if test="${actionList}">
            <th style="border-left:none;background: #fff;"></th>
        </g:if>
    </tr>
    </thead>
    <tbody>
        <g:each in="${dataList}" var="data">
            <tr>
                <g:if test="${multiSelect}">
                %{--style="width:20px;text-align: center;"--}%
                    <td></td>
                </g:if>
                <g:if test="${orderNumber}">
                    <<td></td>
                </g:if>
                <g:each in="${customTable}">
                    <td>${data."${it.getMethod}"()}</td>
                </g:each>
                <g:if test="${actionList}">
                    ${actionString}
                </g:if>
            </tr>
        </g:each>
    </tbody>
</table>

<script type="application/javascript">
    var dataObj${attrs.id}={
        columns :${columdefs as grails.converters.JSON},
        defaultSort :${defaultSort as grails.converters.JSON},
        ajaxData :'${(ajaxData as grails.converters.JSON).toString(false)}',
        serverSide : ${serverSide}
    }
    <g:each in="${functionData}">
    dataObj${attrs.id}.columns[${it.key[0]}].${it.key[1]}=${it.value}
    </g:each>
    <g:if test="${defaultScript}">
            $(document).ready( function() {
                var dataobj=dataObj${attrs.id}
                table${attrs.id}=$('#'+${attrs.id}).DataTable( {
                    "columns":dataobj.columns,
                    "order" :dataobj.defaultSort,
                    "processing": true ,
                    "serverSide": ${serverSide},
                    //控制dataTable的布局很重要 很重要
                    //dom: 'lrtip',
                    /*autoWidth: false,
                     scrollX: true,*/
                    autoWidth :true,
                    "ajax":  {
                        "url": "${url}",
                        "type": "POST",
                        "data": function ( d ) {
                            return {
                                'tableData':JSON.stringify(d),
                                'ajaxData' :dataobj.ajaxData
                            };
                        }
                    }
                });
            } );
    </g:if>

</script>