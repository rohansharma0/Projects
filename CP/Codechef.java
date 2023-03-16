/* ROHAN SHARMA */
import java.util.*;
import java.lang.*;
import java.io.*;

/* Name of the class has to be "Main" only if the class is public. */
public class Codechef
{
    public static final FastScanner sc = new FastScanner();


    public static int euclidGCD(int a , int b){
        // Euclidean algo
        // TC - O(logB)
        // SC - O(logB)

        if(b == 0){
            return  a;
        }else{
            return euclidGCD(b , a % b);
        }
    }


    public static void main (String[] args) throws java.lang.Exception
    {
        FastWriter out = new FastWriter();

        int T = sc.nextInt();


        while (T-- > 0) {
            //write your code

            int a = sc.nextInt();
            int b = sc.nextInt();

            int s = a;
            int e = b;

            int ans = Integer.MAX_VALUE;
            int i = -1;
            int j = -1;

            while (s <= e){

                int m = s + (e - s) /2;
                if(euclidGCD(s , m) > 1 ){
                    if(s + m < ans){
                        ans = s + m;
                        i = s;
                        j = m;
                    }
                    e = m-1;
                }
            }

            if(ans == Integer.MAX_VALUE){
                out.println(-1);
            }else{
                out.println(i + " " + j);
            }

        }
        out.close();
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

class Pair{
    int st;
    int et;

    Pair(int a , int b){
        st = a;
        et = b;
    }

    @Override
    public String toString() {
        return "{" +
                st +
                " , " + et +
                '}';
    }
}