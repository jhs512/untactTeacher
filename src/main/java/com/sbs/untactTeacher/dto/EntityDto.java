package com.sbs.untactTeacher.dto;

import java.util.HashMap;
import java.util.Map;

public class EntityDto {
	public Map<String, Object> extra;
	
	public Map<String, Object> getExtra() {
		return extra;
	}

	public Map<String, Object> getExtraNotNull() {
		if (extra == null) {
			extra = new HashMap<String, Object>();
		}

		return extra;
	}
}
