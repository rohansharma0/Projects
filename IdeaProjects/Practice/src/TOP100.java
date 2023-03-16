import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public class TOP100 {

    public static void main(String[] args) {

//        int n1 = 15 ;
//        int n2 = 2;
//        int a = n1;
//        int b = n2;
//
////        HCF == GCD
//        while( n1 % n2 != 0){
//            int r = n1 % n2;
//            n1 = n2;
//            n2 = r;
//        }
////        LCM
//
//        int hcf = n2;
//        int lcm = (a * b) / hcf;
//
//
//        System.out.println(hcf +"---"+lcm);


////        decimal to any base
//
//        int n = 15;
//
//        int base = 2;
//
//        int p = 0;
//        int num= 0;
//        while(n != 0){
//            int rem = n % base ;
//            num = num + (rem * (int)Math.pow(10,p));
//            p++;
//            n /=base;
//        }
//
//        System.out.println(num);

//        int n = 1000;
//
//        int p = 1;
//        int d = 0;
//        int base = 8;
//
//        while(n > 0){
//
//            int r = n % 10;
//            d = d + (r * p);
//            p = p * base;
//            n = n/10;
//
//
//        }
//
//
//        System.out.println(d);

//
//        int n1 = 3; //p
//        int d1 = 5; //q
//
//        int n2 = 7;//r
//        int d2 = 2;//s
//
//        int n = (n1* d2) + (n2 * d1);
//        int d = d1 * d2;
//

//        int n = 5002;
//        int p = 1;
//
//        int num = 0;
//
//        while(n > 0){
//            int r = n % 10;
//
//            num = num + ((r == 0 ? 1:r) * p);
//            p = p * 10;
//            n /=10;
//        }
//
//        System.out.println(num);

//        int n = 34;
//
//        for(int i = 2 ; i<= n/2 ; i++){
//            if(isPrime(i) == true){
//                if(isPrime(n - i) == true){
//                    System.out.println(i+"--"+(n-i));
//                }
//            }
//        }

//        char ch = 't';
//        System.out.println((int)ch);

//        (year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
//        ;






//        int min = Integer.MAX_VALUE;
//
//        for(int i = 0; i< arr.length ; i++){
//            if(arr[i] < min){
//                min = arr[i];
//            }
//        }

//        int min = Integer.MAX_VALUE;
//        int sMin = Integer.MAX_VALUE;
//
//        for(int i = 0 ; i< arr.length ; i++){
//
//
//            if(arr[i] < min){
//                sMin = min;
//                min = arr[i];
//            }else{
//                if(arr[i] < sMin){
//                    sMin = arr[i];
//                }
//            }
//
//        }
////
//        System.out.println(sMin);


//        int i = 0;
//        int j = arr.length -1;
//
//        while(i < j){
//            swap(arr , i , j);
//        }

//        int k = -2;
//
//        k = k % arr.length;
//
//        if(k < 0){
//            k = k + arr.length;
//        }
//
//        reverse(arr , 0 , arr.length- 1 -k);
//        reverse(arr , arr.length-k , arr.length-1);
//        reverse(arr , 0 , arr.length -1);
//
//
//        for(int e : arr){
//            System.out.print(e + " ");
//        }

//        int [] arr = {12 , 2 ,5,3 , 9};
//
//        Map<Integer , Integer> res = new TreeMap<>();
//
//        for(int i = 0; i< arr.length ; i++){
//
//            res.put(arr[i] , i);
//
//        }
//
//        System.out.println(res);

//        StringBuilder str = new StringBuilder("prepinsta");
//
//        for(int i = 0 ; i<str.length() ; i++){
//            if(str.charAt(i) == 'a'
//                    || str.charAt(i) == 'e'
//                    || str.charAt(i) == 'i'
//                    || str.charAt(i) == 'o'
//                    || str.charAt(i) == 'u'){
//
//                str.deleteCharAt(i);
//
//            }
//        }

        String str = "prep inst is best";


        char [] ch = str.toCharArray();

        ch[0] = (char)((int)ch[0] - 32);
        ch[ch.length-1] = (char)((int)ch[ch.length-1] - 32);

        for(int i = 1 ; i < ch.length-1 ; i++){
            if(ch[i+1] == ' '){
                ch[i] = (char)((int)ch[i] - 32);
                ch[i+2] = (char)((int)ch[i+2] - 32);
            }
        }
        String s = new String(ch);
        System.out.println(s);


    }

    public static void reverse(int[] arr , int i , int j){

        while(i < j){
            int temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
            i++;
            j--;
        }

    }


    public static boolean isPrime(int n){
        boolean flag = true;
        for(int i= 2 ; i*i <= n ; i++){
            if(n % i == 0){
                flag = false;
                break;
            }
        }
        return flag;
    }
}
