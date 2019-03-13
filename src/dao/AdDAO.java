package dao;
import java.util.ArrayList;

import model.Ad;

public interface AdDAO {
	public void addAD(Ad ad); //ê¸? ???¥?•˜ê¸?
	public Ad getAD(int id); //ê¸? ë¶ˆëŸ¬?˜¤ê¸?
	public ArrayList<Ad> getAllEvent(String type); //ë¦¬ìŠ¤?Š¸ êµì™¸/êµë‚´ ?‚˜?ˆ ?„œ ë¶ˆëŸ¬?˜¤ê¸?
	public void deleteAD(int id);
}
