package manpro;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import entities.User;
import metier.Imetier;

public class Test {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		Imetier metier = context.getBean(Imetier.class);
		metier.addUser(new User("Ayoub Ait Lahcen", "ayoubal620@gmail.com", "ayoub.62", "A123456789", "066666666"));
		metier.addUser(new User("Achraf Ghariss", "okanimemaroc0@gmail.com", "achraf.ghariss", "A123456789", "066666666"));
		
		((AbstractApplicationContext) context).close();
		
	}

}
