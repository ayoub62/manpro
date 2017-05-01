package metier;

import entities.User;

public interface Imetier {
	void addUser(User user);
	boolean findEmail(String email);
	public Long userExist(String pseudo, String motdepasse);
	boolean findPseudo(String pseudo);
	User getUserById(Long userId);
	void updateUser(User user);
}
