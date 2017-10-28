var ${lastName}count = \${${propertyName}.${questionMarkName}?.size()?:0}
//初始化editor
${lastName}editor = new \$.fn.dataTable.Editor({
    //重写请求方法(拦截)
    ajax: function(method, url, data, success, error) {
    if (data.action === 'edit') {
        out = {data: []};
        \$.each(data.data, function (key, val) {
            var oldObj
            var datas = ${lastName}Obj.data()
            for (var i = 0; i < datas.length; i++) {
                if (datas[i]["DT_RowId"] == key) {
                    oldObj = datas[i]
                    break;
                }
            }
            out.data.push(\$.extend(oldObj, val));
        });
        success(out);
    }
},
    table: "#${lastName}",
    //要编辑的字段(要另外加)
    fields: [

     ]
    });
\$('#${lastName}').on('click', 'tbody td:not(:first-child)', function (e) {
    ${lastName}editor.inline(this, {
        onBlur: "submit"
    });
});
//初始化DataTable
${lastName}Obj = \$('#${lastName}').DataTable({
            "ordering": false,
            //datatables的字段(要另外加)
            dom: 'tip',
            columns: [
                {data: "DT_RowId", visible: false},
                {data: "multiSelect"}
            ]
        });
//添加方法
\$('#addRow').on('click', function () {
    ${lastName}count++
    //要添加的字段(要另外加)
    var addObj = {
        DT_RowId: ${lastName}count,
        multiSelect: '<input style="width: 30px;text-align: center;" type="checkbox" name="checkbox_name[]">'
    }
    ${lastName}Obj.row.add(addObj).draw(false);
})
//多选
multiSelectInit(${lastName}Obj)
batchDelByEditInit(${lastName}Obj)