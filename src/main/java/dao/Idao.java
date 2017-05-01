package dao;

import entities.User;

public interface Idao {
	void addUser(User user);
	boolean findEmail(String email);
	Long userExist(String pseudo,String motdepasse);
	boolean findPseudo(String pseudo);
	User getUserById(Long userId);
	void updateUser(User user);
}
