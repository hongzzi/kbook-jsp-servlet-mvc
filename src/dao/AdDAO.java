package dao;
import java.util.ArrayList;

import model.Ad;

public interface AdDAO {
	public void addAD(Ad ad); //�? ???��?���?
	public Ad getAD(int id); //�? 불러?���?
	public ArrayList<Ad> getAllEvent(String type); //리스?�� 교외/교내 ?��?��?�� 불러?���?
	public void deleteAD(int id);
}
