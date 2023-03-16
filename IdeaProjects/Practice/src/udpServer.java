import java.net.*;
import java.util.*;

public class udpServer {
    public static void main(String[] args) throws Exception {

        Scanner sc = new Scanner(System.in);
        DatagramSocket socket = new DatagramSocket(8759);
        byte[] recieve = new byte[1024];
        byte[] send = new byte[1024];

        //receiving the data from client
        while (true) {
            DatagramPacket packet = new DatagramPacket(recieve, recieve.length);
            socket.receive(packet);
            String str = new String(packet.getData());

            System.out.println("CLIENT - " + str.toUpperCase());

            //sending data to client
            System.out.print("\nSERVER - ");
            String number = sc.nextLine();

            send = number.getBytes();

            InetAddress address = InetAddress.getLocalHost();
            DatagramPacket sender = new DatagramPacket(send, send.length, address, packet.getPort());
            socket.send(sender);
            if (number.equalsIgnoreCase("exit")) {
                System.out.println("Server exiting....");
                break;
            }
        }
    }

}

