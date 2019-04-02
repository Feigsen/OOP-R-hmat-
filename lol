import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

public class Tic_tac_toe {
    static final int X = 3;
    static final int Y = 3;
    static final char mangija = 'X';
    static final char TI = 'O';
    static final char tuhi = '*';
    static final char [][] vali = new char[Y][X];
    static Scanner s = new Scanner(System.in);
    static Random suv = new Random();

    public static void main(String[] args) {
        initVali();
        printVali();
    }
    static void initVali() {
        for (int i = 0; i<Y; i++){
            for (int j = 0; j<X; j++){
                vali[i][j] = tuhi;
            }
        }
    }
    static void printVali(){
        for (int i=0; i<Y; i++){
            for (int j = 0; j<X; j++){
                System.out.print(vali[i][j] + "\t");
            }
            System.out.println();
        }
    }
    static void sumbol (int x, int y, char sum){
        vali[y][x] = sum;
    }
    static void mangijaSamm (int x, int y) {
        do {
            x = s.nextInt() - 1;
            y = s.nextInt() - 1;
        } while (!kasTehaSamm(x,y));
        vali[y][x] = mangija;
    }
    static void tiSamm(){
        int x, y;
        do {
            int x = suv.nextInt(X);
            int y = suv.nextInt(Y);
        } while (!kasTehaSamm(x, y));
        vali[y][x] = TI;
    }
    static boolean kasTehaSamm (int x, int y) {
        if (x < 0 || x >= X || y < 0 || y >= Y) return false;
        if (vali[y][x] == tuhi) return true;
    }
}
