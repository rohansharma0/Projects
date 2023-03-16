import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;


public class TCPClient {

    public static void main(String[] args) throws Exception {

        Socket s = new Socket("localhost", 5000);

        Scanner sc = new Scanner(System.in);
        String word = sc.nextLine();
        PrintWriter pr = new PrintWriter(s.getOutputStream());
        pr.println("Client:" + word);
        pr.flush();

        InputStreamReader in = new InputStreamReader(s.getInputStream());
        BufferedReader br = new BufferedReader(in);
        String str = br.readLine();
        System.out.println(str);
        s.close();


    }
}
