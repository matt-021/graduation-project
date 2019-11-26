//import com.lin.dao.IaccountDao;
//import com.lin.domain.Account;
//import org.apache.ibatis.io.Resources;
//import org.apache.ibatis.session.SqlSession;
//import org.apache.ibatis.session.SqlSessionFactoryBuilder;
//import org.junit.Test;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//
//import java.io.*;
//import java.util.ArrayList;
//import java.util.List;
//
//
//public class Test1 {
//
//   //测试spring
//    @Test
//    public void test1(){
//        ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
////        AccoutService as= (AccoutService) ac.getBean("accoutservice");
////        as.findall();
////        as.saveAccout();此类被删了
//
//    }
//
//
//    //测试mybatis
//    @Test
//    public void test2() throws Exception {
//        InputStream inputStream=Resources.getResourceAsStream("applicationContext.xml");
//        SqlSession session = new SqlSessionFactoryBuilder().build(inputStream).openSession();
//        IaccountDao dao=session.getMapper(IaccountDao.class);
////        List<Account> list=dao.findall();
////        for(Account account :list){
////            System.out.println(account);
////        }
//        inputStream.close();
//        session.close();
//    }
//    @Test
//    public void test3() throws Exception {
//        Account account=new Account();
//        account.setName("福气111");
//        account.setMoney(1000000);
//        InputStream inputStream=Resources.getResourceAsStream("applicationContext.xml");
//        SqlSession session = new SqlSessionFactoryBuilder().build(inputStream).openSession();
//        IaccountDao dao=session.getMapper(IaccountDao.class);
////       dao.saveAccout(account);
//        session.commit();
//        inputStream.close();
//        session.close();
//    }
//
//    @Test
//    public void test() throws IOException {
//    /*    InputStream input = null;
//        try {
//            input = new FileInputStream("..\\test11\\test11.txt");
//            byte[] c=new byte[1024];
//
//            int n;
//            while ((n = input.read(c)) != -1) { // 利用while同时读取并判断
//                System.out.print(new String(c,0,n));
//            }
//        } finally {
//            if (input != null) { input.close(); }
//        }*/
//
////        OutputStream output = new FileOutputStream("..\\test11\\test11.txt");
////        output.write("Hello".getBytes("UTF-8")); // Hello
////        output.close();
//        String[] color={"a","b","c","d"};
//       for (int i=1;i<13;i++){
//           System.out.println(color[(i-1)%4]);
//       }
//
//
//    }
//
//
//}
