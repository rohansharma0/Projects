import java.util.Scanner;

public class CRCError {

     public static String fun_xor(String a, String b)
    {
        String result = "";
        int n = b.length();
        for (int i = 1; i < n; i++){
            if(a.charAt(i) == b.charAt(i)){
                result +='0';
            }
            else{
                result +='1';
            }
        }

        return result;
    }

    public static String mod2div(String dividend, String divisor){

        int len_div = divisor.length(); // divisor length
        String temp = dividend.substring(0, len_div);

        int n = dividend.length();

        while (len_div < n)
        {
            if (temp.charAt(0) == '1')
            {
                temp = fun_xor(divisor, temp) + dividend.charAt(len_div);
            }
            else
            {
                String tempZero="";

                for(int i = 0 ; i< len_div ; i++){
                    tempZero += "0";
                }
                temp = fun_xor(tempZero, temp) + dividend.charAt(len_div);
            }
            len_div += 1;
        }

        if (temp.charAt(0) == '1'){
            temp = fun_xor(divisor, temp);

        }
        else{
            String tempZero="";

            for(int i = 0 ; i<= len_div ; i++){
                tempZero += "0";
            }
            temp = fun_xor(tempZero, temp);

        }
        return temp;
    }


    public static void encodeData(String data , String key){

        int len_key = key.length();

        // append the length of key - 1 zeros at the end of data

        String append_data = data;

        for(int i = 0 ; i<len_key -1 ; i++){
            append_data += "0";
        }

        String remainder = mod2div(append_data, key);

        String codeword = data + remainder;

        System.out.println("Remainder : "+ remainder);
        System.out.println("Encoded data: "+ codeword);


    }


    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.println("Enter data word to be send:");

        String data = sc.next();

        System.out.println("Enter key to be send:");

        String key = sc.next();

        encodeData(data, key);

    }

}
