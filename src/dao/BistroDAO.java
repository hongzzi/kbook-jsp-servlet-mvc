package dao;
import java.util.ArrayList;

import model.Bistro;

public interface BistroDAO {
	public ArrayList<Bistro> getAllEvent(String type);
}
