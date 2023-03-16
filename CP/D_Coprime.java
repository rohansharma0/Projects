/* ROHAN SHARMA */
import java.util.*;
import java.lang.*;
import java.io.*;

/* Name of the class has to be "Main" only if the class is public. */
public class D_Coprime
{
    public static final FastScanner sc = new FastScanner();

    public static void main (String[] args) throws java.lang.Exception
    {
        FastWriter out = new FastWriter();


        int T = sc.nextInt();

        while(T-- > 0){

            int n = sc.nextInt();

        int[] arr = sc.readArray(n);

            int max = -1;

            for(int i = 0 ; i< n; i++){
                for(int j = i ; j < n ; j++){
                    if(gcd(arr[i] , arr[j]) == 1){
                        max = Math.max(max ,i+j + 2);
                    }
                }
            }

            System.out.println(max);

        }

    }

    public static int gcd(int a , int b){
        if(b == 0) return a;

        return gcd(b , a % b);
    }


    static class FastScanner {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer("");
        String next() {
            while (!st.hasMoreTokens())
                try {
                    st = new StringTokenizer(br.readLine());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            return st.nextToken();
        }
        String nextLine(){
            String str="";
            try {
                str=br.readLine().trim();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return str;
        }
        int nextInt() {
            return Integer.parseInt(next());
        }
        int[] readArray(int n) {
            int[] a = new int[n];
            for (int i = 0; i < n; i++) a[i] = nextInt();
            return a;
        }
        long nextLong() {
            return Long.parseLong(next());
        }
        double nextDouble(){
            return Double.parseDouble(next());
        }

    }

    static class FastWriter {
        private final BufferedWriter bw;

        public FastWriter() {
            this.bw = new BufferedWriter(new OutputStreamWriter(System.out));
        }

        public void print(Object object) throws IOException {
            bw.append("" + object);
        }

        public void println(Object object) throws IOException {
            print(object);
            bw.append("\n");
        }

        public void close() throws IOException {
            bw.close();
        }
    }
}

