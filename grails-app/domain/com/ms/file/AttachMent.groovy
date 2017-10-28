package com.ms.file

import com.ms.FileType
import com.ms.annotation.GridColumn
import com.ms.base.util.Util

class AttachMent {
	String id


	//附件名称(更改后的文件名)
	String name
 
	//文件类型：normal:普通附件;word:word正文;pdf:pdf文件 image:image文件;excel:Excel文件;ppt:PPT文件;txt:文本文档;zip:压缩文件;music:音乐文件;movie:视屏文件;
	FileType type = FileType.normal
    @GridColumn(name="文件类型",colIdx=4)
    def formattedType(){
        type?.getTypeName()
    }
	//附件存放地址
	String url

	//附件保存时的实际名称(中文名)
	String realName
	@GridColumn(name="文件名",colIdx=2)
	def formattedRealName(){
		if(realName){
            Util.getLimitLengthString(this.realName,15, "...")
        }else{
            ""
        }
	}
    def arrayRealName(){
        def arrayRealName=["",""]
        if(realName){
            def array = realName.split("\\.")
            if(array.size()>2){
                arrayRealName=[array[0],array.last()]
            }else if(array.size()==2){
                arrayRealName=array
            }else if (array.size()==1){
                arrayRealName=[array[0],""]
            }
        }
        arrayRealName
    }
	def getFileTypeValue(){
		return Util.strRight(this.realName, ".")
	}

	//附件大小[0:b ,1:k,2:m,3:g]
	BigDecimal attachMentSize
    @GridColumn(name="文件大小",colIdx=5)
    def formattedAttachMentSize(){
        if(attachMentSize){
            if(attachMentSize>new BigDecimal(1024)*1024*1024){
                "${attachMentSize.divideToIntegralValue(new BigDecimal(1024)*1024*1024).setScale(0, BigDecimal.ROUND_HALF_UP)} GB"
            }else if(attachMentSize>new BigDecimal(1024)*1024){
                "${attachMentSize.divideToIntegralValue(new BigDecimal(1024)*1024).setScale(0, BigDecimal.ROUND_HALF_UP)} MB"
            }else if(attachMentSize>new BigDecimal(1024)){
                "${attachMentSize.divideToIntegralValue(new BigDecimal(1024)).setScale(0, BigDecimal.ROUND_HALF_UP)} KB"
            }else{
                "${attachMentSize.divideToIntegralValue(new BigDecimal(1)).setScale(0, BigDecimal.ROUND_HALF_UP)} B"
            }
        }else{
            ""
        }
    }
    //创建时间
	Date            dateCreated
    @GridColumn(name="创建时间",colIdx=6)
    def getFormattedCreatedName(){
        if(dateCreated){
            return dateCreated.format("yyyy年MM月dd日")
        }else{
            return ''
        }
    }
	//创建人
	String          createUser
	//更新时间
	Date            lastUpdated 
	//最后更新人
	String          lastUpdatedUser
	
	//目录
	static belongsTo = [directory: Directory]
    @GridColumn(name="存放目录",colIdx=3)
    def getFormattedDirectory(){
        if(directory){
            directory.formattedDirName()
        }else{
            ""
        }
    }
	Integer flag=0 
	
	static mapping = { 
	}
	static constraints = {
	}
	def beforeDelete(){
        //删除相关的文件
        try {
            if(this.url){
                File file = new File(this.url)
                if(file.isFile() && file.exists()){
                    file.delete()
                }
            }
        } catch (Exception e) {
            log.error("delete Wrong$e")
        }
	}
}
