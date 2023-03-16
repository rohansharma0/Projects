import java.net.*;
import java.io.*;

public class MultiCastReciver {
    public static void main(String[] args) throws IOException{
        String group = args[0];
        MulticastSocket ms = new MulticastSocket(5000);
        ms.joinGroup(InetAddress.getByName(group));
        byte[] buf = new byte[1024];
        DatagramPacket dp = new DatagramPacket(buf,1024);
        ms.receive(dp);
        String str = new String(dp.getData(),0,dp.getLength());
        System.out.println(str);
        ms.leaveGroup(InetAddress.getByName(group));
        ms.close();
    }
}
