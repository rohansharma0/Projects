import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

public class TCPServer {
    public static void main(String args[]) throws Exception {
        ServerSocket ss = new ServerSocket(5000);
        Socket s = ss.accept();
        System.out.println("Client connected");

        InputStreamReader in = new InputStreamReader(s.getInputStream());
        BufferedReader br = new BufferedReader(in);
        String str = br.readLine();
        System.out.println(str);

        Scanner sc = new Scanner(System.in);
        String word = sc.nextLine();
        PrintWriter pr = new PrintWriter(s.getOutputStream());
        pr.println("Server: " + word);
        pr.flush();
    }
}
