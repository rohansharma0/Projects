import java.net.*;

class portScanner {
    public static void main(String args[]) {
        Socket s;
        for (int i = 1; i < 65536; i++) {
            try {
                s = new Socket(args[0], i);
                System.out.println("Port in use: " + i);
            } catch (Exception e) {

            }
            System.out.println("Ports not in use: " + i);

        }
    }

}
