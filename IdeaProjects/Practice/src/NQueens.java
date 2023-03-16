import java.util.ArrayList;
import java.util.List;

public class NQueens {

    public static List<List<String>> res = new ArrayList<>();

    public static void main(String[] args) throws Exception {

        int n = 4;

        char[][] board = new char[n][n];

        for(int i = 0 ; i< n ; i++){
            for(int j = 0 ; j< n; j++){
                board[i][j] = '.';
            }
        }

        solveNQueens(board, 0 , n);

        System.out.println(res);

    }

    public static void solveNQueens(char[][] board , int row , int n) {


        if(row == n){
            res.add(construct(board));
            return;
        }

        for(int col = 0 ; col<n ; col++){

            if(isSafeForQueen(board, row, col)){
                board[row][col] = 'Q';
                solveNQueens(board, row + 1 , n);
                board[row][col] = '.';
            }

        }

    }

    public static boolean isSafeForQueen(char[][] chess , int row , int col){

        for(int i = row -1; i>= 0 ; i--){
            if(chess[i][col] == 1){
                return false;
            }
        }
        for(int i = row - 1, j = col -1 ; i>= 0 && j>=0 ; i-- , j--){
            if(chess[i][j] == 1){
                return false;
            }
        }
        for(int i = row - 1, j = col +1 ; i>= 0 && j< chess.length ; i-- , j++){
            if(chess[i][j] == 1){
                return false;
            }
        }
        return true;
    }

    public static List<String> construct(char [][] board){
        List<String> res = new ArrayList<>();

        for(int i = 0 ;i< board.length ; i++){
            String s = new String(board[i]);
            res.add(s);
        }
        return  res;
    }
}