package com.sbs.untactTeacher.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Article extends EntityDto {
	private int id;
	private String regDate;
	private String updateDate;
	private int boardId;
	private int memberId;
	private String title;
	private String body;

	private String extra__writer;
	private String extra__boardName;
	private String extra__thumbImg;
	
	public String getWriterThumbImgUrl() {
		return "/common/genFile/file/member/" + memberId + "/common/attachment/1";
	}
}
