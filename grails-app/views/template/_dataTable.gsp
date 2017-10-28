<%@page expressionCodec="none" %>
    <table ${tableField}>
        <thead>
        <tr>
            <th></th>%{--留给id--}%
            <g:if test="${ajaxData["defaultMap"]["multiSelect"]}">
                %{--style="width:20px;text-align: center;"--}%
                <th style="width: 30px;text-align: center;"><input type="checkbox" class="check_control"></th>
            </g:if>
            <g:if test="${ajaxData["defaultMap"]["orderNumber"]}">
                <th style="width: 30px;text-align: center;">序列</th>
            </g:if>
            <g:each in="${gridColumns}">
                <th>${it.name()}</th>
            </g:each>
            <g:if test="${ajaxData["defaultMap"]["actionList"]}">
                <th style="border-left:none;background: #fff;"></th>
            </g:if>
        </tr>
        </thead>
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
            table${attrs.id}=$('#'+'${attrs.id}').DataTable( {
                "columns":dataobj.columns,
                "order" :dataobj.defaultSort,
                "processing": true ,
                "serverSide": ${serverSide},
                //控制dataTable的布局
                dom: 'lrtip',
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
            dataTablesInit(table${attrs.id});
        } );
    </g:if>

</script>