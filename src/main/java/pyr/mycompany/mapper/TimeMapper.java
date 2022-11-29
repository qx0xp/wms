package pyr.mycompany.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
	@Select("SELECT SYSDATE()")
	public String getTime();
}
