package com.sbs.untactTeacher.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board extends EntityDto {
	private int id;
	private String regDate;
	private String updateDate;
	private String code;
	private String name;
}
