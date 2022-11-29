package pyr.mycompany.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pyr.mycompany.domain.InventoryDTO;
import pyr.mycompany.mapper.PopupMapper;

@Service
public class PopupServiceImpl implements PopupService{
	@Autowired
	PopupMapper pmapper;
	
	public ArrayList<InventoryDTO> list(){
		return pmapper.list();
	}
}
