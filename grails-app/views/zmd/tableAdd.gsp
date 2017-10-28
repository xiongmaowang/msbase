<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="dataEditWithTableEditor">
</head>

<body class="gray-bg">


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <!--搜索条件-->
                    <div class="form-inline" role="form">
                        <div class="pull-right" style="margin-top: 8px;">
                            <button class="btn btn-danger btn-md batch-del" style="margin-right:10px;">
                                <span class="fa fa-edit"></span>
                                批量删除
                            </button>
                            <button class="btn btn-success btn-md" id="addRow">
                                <span class="fa fa-plus"></span>
                                添加一条</button>
                            <button class="btn btn-success btn-md" id="233">
                                <span class="fa fa-plus"></span>
                                添加一条</button>
                        </div>
                    </div>
                    <table id="example" class="table table-striped table-bordered table-hover dataTables-example dataTable no-footer" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th style="width: 30px;text-align: center;"><input type="checkbox" class="check_control"></th>
                            <th>序号</th>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Position</th>
                            <th>Office</th>
                            <th width="18%">Start date</th>
                            <th>Salary</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input style="width: 30px;text-align: center;" type="checkbox" name="checkbox_name[]"></td>
                            <td>1</td>
                            <td>1</td>
                            <td>啊啊啊啊</td>
                            <td>Position</td>
                            <td>1</td>
                            <td width="18%">Start date</td>
                            <td>Salary</td>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 自定义js -->
<!-- Page-Level Scripts -->
<script>
    var count=1
        $(document).on("click","#233",function (e){
            editor.submit();
            var datas=tableobj.data()
            var result={}
            $.each(datas, function(index,val) {
                $.each(this,function(name,value){
                    if(name!="multiSelect"&&name!="DT_RowId"&&value&&value!=""){
                        result["res"+"["+index+"]."+name]=value
                    }
                })
            });
            console.log(result)
            /*        $.ajax({
             url: "/msbase/table/testaa",
             type:"post",
             data: result
             });*/
        })
    function ajaxdata(e){

    }
    function dataAdd(){
       // tableobj.columns().dataSrc().each(dataSrc,)
    }
    function onlyNum(event){
        var keyCode = event.which;
        if (keyCode == 46 || keyCode == 8 || keyCode == 37 || keyCode == 39 || (keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) )
        { return true; }
        else { return false }
    }
    $(document).ready(function() {

        //$("#sbsbI").keydown(onlyNum);
        $(document).on("keydown","#sbsbI",onlyNum)

        editor = new $.fn.dataTable.Editor( {
            ajax:function ( method, url, data, success, error ) {
                if ( data.action === 'edit' ) {
                    $.each( data.data, function ( key, val ) {
                        var oldObj;
                        out = { data: [] };
                        var datas=tableobj.data()
                        for(var i=0;i<datas.length;i++){
                            if(datas[i]["DT_RowId"]==key){
                                oldObj=datas[i]
                                break;
                            }
                        }
                        out.data.push( $.extend(oldObj,val) );
                    } );
                    success( out );
                }
            },
            table: "#example",
            fields: [
                    {
                    label: "First name:",
                    name: "first_name",
                        "id":"sbsbI"
                }, {
                    label: "Last name:",
                    name: "last_name",
                    type: "select",
                    options: [
                        { label: "啊啊啊啊" },
                        { label: "啊啊啊" }
                    ],
                    def:"啊啊啊啊"
                }, {
                    label: "Position:",
                    name: "position",
                    "id":"sbsbI"
                }, {
                    label: "Office:",
                    name: "office"
                }, {
                    label: "Extension:",
                    name: "extn"
                }, {
                    label: "Start date:",
                    name: "start_date",
                    type: "datetime"
                }, {
                    label: "Salary:",
                    name: "salary"
                }
            ]
        } );

        // Activate an inline edit on click of a table cell

        $('#example').on( 'click', 'tbody td:not(:first-child)', function (e) {
            editor.inline( this, {
                onBlur: "submit"
            } );
        } );
        //验证
        editor.on( 'preSubmit', function ( e, o, action ) {
            if ( action !== 'remove' ) {
                 firstName = editor.field( 'first_name' );
                // Only validate user input values - different values indicate that
                // the end user has not entered a value
                if ( ! firstName.isMultiValue() ) {
                    if ( ! firstName.val() ) {
                        firstName.error( 'A first name must be given' );
                    }

                    if ( firstName.val().length >= 20 ) {
                        firstName.error( 'The first name length must be less that 20 characters' );
                    }
                }

                // ... additional validation rules

                // If any error was reported, cancel the submission so it can be corrected
                if ( this.inError() ) {
                    return false;
                }
            }
        } );
        tableobj=$('#example').DataTable( {
            "ordering": false,
            columns:
                [
                    {data:"multiSelect"},
                    { data:"DT_RowId",visible:false},
                    { data: "first_name" ,type:"num"},
                    { data: "last_name" ,type:"string" },
                    { data: "position" ,type:"num" },
                    { data: "office" },
                    { data: "start_date" },
                    { data: "salary", render: $.fn.dataTable.render.number( ',', '.', 0, '$' ) }
                ]
        } );

        //添加方法
        $('#addRow').on( 'click', function () {
            count =tableobj.data().length+1
            var addObj={
                multiSelect:'<input style="width: 30px;text-align: center;" type="checkbox" name="checkbox_name[]">',
                DT_RowId:  count,
                first_name:null,
                last_name:null,
                position: null,
                office: null,
                start_date:null,
                salary: null
            }
            tableobj.row.add(addObj).draw( false );

        } );
        //多选
        multiSelectInit(tableobj)
        batchDelByEditInit(tableobj)

    } );
</script>
</body>
</html>



