package com.ms;

public enum FileType {
	image("图片"),word("文档"),ppt("幻灯片"),music("音乐"),movie("影像"),excel("表格"),zip("压缩文件"),pdf("PDF"),normal("文件");
	private String typeName;
	public static def typeList=getAllFileTypeList()
	FileType(String typeName){
		this.typeName=typeName;
	}
	public String getTypeName(){
		return typeName;
	}
	static def getAllFileTypeList(){
		def typeMap=[:]
		typeMap[FileType.image]=["JPG","JPEG","PNG","SVG","JPEG2000","TIFF","PSD","GIF","BMP","ICO"]
		typeMap[FileType.word]=["DOC","DOCX"]
		typeMap[FileType.ppt]=["PPT","PPTX"]
		typeMap[FileType.music]=["MP3","WMA","WAV","MOD","RA","CD","MD","ASF","MP3PRO","VQF","FLAC","APE","MID","OGG","M4A","AAC","AAC+","AIFF","AU","VQF"]
		typeMap[FileType.movie]=["AVI","WMV","3GP","ASF","ASX","MID","MP4","M4V","RM","RMVB","MPG","MPEG","MPE","MOV","DAT","MKV","VOB"]
		typeMap[FileType.excel]=["XLSX","XLS"]
		typeMap[FileType.zip]=["ZIP","RAR","7Z","ISO","JAR","CAB"]
		typeMap[FileType.pdf]=["PDF"]
		typeMap 
	}
		
	static def testFileType(String oType){
		FileType filType =FileType.normal
		for(def type:typeList){
			if(oType in type.value){
				filType=type.key							
				 break 
			}		 
		}  
		filType
	}
}
