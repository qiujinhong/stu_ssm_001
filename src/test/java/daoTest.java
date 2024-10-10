import com.codejams.domain.Admin;
import com.codejams.domain.Book;
import com.codejams.domain.Borrower;
import com.codejams.service.BookService;
import com.codejams.service.AdminService;
import com.codejams.service.BorrowerService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;


public class daoTest {


    private AdminService adminService = new AdminService();
    private BookService bookService = new BookService();
    private BorrowerService borrowerService = new BorrowerService();

    @Test
    public void test01(){
        Admin admin = new Admin();
        admin.setUsername("zs");
        admin.setPassword("123");
        boolean login = adminService.login(admin);
        System.out.println(login);

    }

    @Test
    public void test02(){
        for (Book book : bookService.findAllBook()) {
            System.out.println(book);
        }

    }

    @Test
    public void test03(){
        for (Book book : bookService.findBookByCondition("3")) {
            System.out.println(book);
        }

    }

    @Test
    public void test04(){
        for (Borrower borrower : borrowerService.findBorrowerByCondition("2")) {
            System.out.println(borrower);
        }

    }

    @Test
    public void test05(){
        bookService.changeStatusToLeisure("JVM");

    }

    @Test
    public void test06(){
        bookService.changeStatusToNotLeisure("JVM");
    }

    @Test
    public void test07() throws JsonProcessingException {
        Book book = new Book();
        book.setId(1);
        book.setName("老六");
        book.setAuthor("hello");
        book.setDetail("hhaha");

        ObjectMapper mapper = new ObjectMapper();

        String json = mapper.writeValueAsString(book);
        System.out.println(json);
    }
}
