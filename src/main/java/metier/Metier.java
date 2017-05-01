package metier;

import dao.Idao;
import entities.User;

public class Metier implements Imetier{
	
	private Idao dao;
	
	@Override
	public void addUser(User user) {
		user.setPdpURL("default.jpg");
		this.dao.addUser(user);
	}

	public Idao getDao() {
		return dao;
	}

	public void setDao(Idao dao) {
		this.dao = dao;
	}
	
	public Metier() {
	}

	@Override
	public boolean findEmail(String email) {
		return dao.findEmail(email);
	}

	@Override
	public Long userExist(String pseudo, String motdepasse) {
		return dao.userExist(pseudo, motdepasse);
	}

	@Override
	public boolean findPseudo(String pseudo) {
		return dao.findPseudo(pseudo);
	}

	@Override
	public User getUserById(Long userId) {
		return dao.getUserById(userId);
	}

	@Override
	public void updateUser(User user) {
		dao.updateUser(user);
	}
}
