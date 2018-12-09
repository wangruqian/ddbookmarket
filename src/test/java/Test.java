import com.oracle.ddbook.util.MD5Util;

public class Test {
    public  static void main(String[] args)throws Exception{
        String str="admin";
        System.out.println(MD5Util.getEncryptedPwd(str));

    }
}
