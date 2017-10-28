${lastName}editor.submit();
var datas=${lastName}Obj.data();
if(${lastName}Obj.data().length>0){
    var result={};
    \$.each(datas, function(index,val) {
        \$.each(val,function(name,value){
            if(name!="multiSelect"&&name!="DT_RowId"&&value&&value!=""){
                result["${name}"+"["+index+"]."+name]=value;
            }
        })
    });
    data=\$.param(result)+"&"+data;
}