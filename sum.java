package action;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
public class sum extends ActionSupport{
	private String AuthorName;
	public String execute() throws Exception{
		return "res";
	}
	public String getAuthorName()
    {
		return AuthorName;
    }
	public void setAuthorName(String AuthorName)
    {
        System.out.println(AuthorName);
          this.AuthorName = AuthorName;
    }
}
