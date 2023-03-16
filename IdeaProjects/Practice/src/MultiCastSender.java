import java.net.*;
import java.io.*;


public class MultiCastSender {
    public static void main(String[] args) throws IOException {
        String group = "225.4.5.6";
        MulticastSocket ms = new MulticastSocket();
        String message = "Hello, it's send by the anonymous user";
        DatagramPacket dp = new DatagramPacket(message.getBytes(),
                message.length(), InetAddress.getByName(group), 5000);
        ms.send(dp);
        ms.close();
    }
}
