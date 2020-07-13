package mail;

import javax.mail.PasswordAuthentication;
import javax.mail.Authenticator;
 
/**
 * @author viper9
 *
 */
public class SMTPAuthenticator extends Authenticator {
    public SMTPAuthenticator() {
        super();
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        String username = "dhksen805@naver.com";
        String password = "cms9741@@";
        return new PasswordAuthentication(username, password);
    }
}


