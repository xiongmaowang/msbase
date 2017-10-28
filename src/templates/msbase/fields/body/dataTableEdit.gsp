<div class="ibox float-e-margins">
    <div class="ibox-content">
        <!--搜索条件-->
        <div class="form-inline" role="form">
            <div class="pull-right" style="margin-top: 8px;">
                <button class="btn btn-danger btn-md batch-del" style="margin-right:10px;" type="button">
                    <span class="fa fa-edit"></span>
                    批量删除
                </button>
                <button class="btn btn-success btn-md" id="addRow" type="button">
                    <span class="fa fa-plus"></span>
                    添加一条</button>
            </div>
        </div>
        <table id="${lastName}"
               class="table table-striped table-bordered table-hover dataTables-example dataTable no-footer"
               cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>序号</th>
                <th style="width: 30px;text-align: center;"><input type="checkbox" class="check_control"></th>
            </tr>
            </thead>
            <tbody>
                <g:each in="\${${propertyName}.${questionMarkName}}" var="it" status="status">
                    <tr>
                        <td>\${status}</td>
                        <td><input style="width: 30px;text-align: center;" type="checkbox" name="checkbox_name[]"></td>
                        <!--要显示的字段(另外加) -->
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
</div>


