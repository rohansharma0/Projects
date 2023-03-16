import java.net.*;
import java.util.*;

public class udpClient {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        DatagramSocket socket = new DatagramSocket();
        byte[] send = new byte[1024];
        byte[] receive = new byte[1024];

        while (true) {
            //sending data to server
            InetAddress address = InetAddress.getLocalHost();
            System.out.print("\nCLIENT - ");
            String input = sc.nextLine();
            send = input.getBytes();
            DatagramPacket packet = new DatagramPacket(send, send.length, address, 8759);
            socket.send(packet);
            if (input.equalsIgnoreCase("exit")) {
                System.out.println("Connection ended by Client");
                break;
            }

            //receiving data from server

            DatagramPacket accept = new DatagramPacket(receive, receive.length);
            socket.receive(accept);
            String str = new String(accept.getData());
            if (str.equalsIgnoreCase("exit")) {
                System.out.println("Connection terminated by server");
                break;
            }

            System.out.println("SERVER - " + str.toUpperCase());

        }

    }
}
