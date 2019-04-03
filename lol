import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

public class Trips_traps_trull {
    static final int X = 3;
    static final int Y = 3;
    static final char mangija = 'X';
    static final char TI = 'O';
    static final char tuhi = '*';
    static final char [][] vali = new char[Y][X];
    static Scanner s = new Scanner(System.in);
    static Random suv = new Random();
    static final int voit = 3;

    public static void main(String[] args) {
        initVali();
        printVali();
        while (true) {
            mangijaSamm();
            printVali();
            if (voit(mangija)) {
                System.out.println("Mängija on võitnud");
                break;
            }
            if(vabakoht()) {
                System.out.println("nichja");
                break;
            }
            tiSamm();
            printVali();
            if(voit(TI)) {
                System.out.println("Arvuti voit");
                break;
            }
            if(vabakoht()) {
                System.out.println("nichja");
                break;
            }
        }    
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
        if (vali[y][x] != tuhi) return false;
        return true;
    }
    static boolean vabakoht(int x, int y) {
        for (int i = 0, i < Y; i++) {
            for (int j = 0; j < X; j++) {
                if(vali[i][j] == tuhi) return true;
            }
        }
        return false;
    }
    
    static boolean kasvoit(char sym) {
        for (int i = 0; i < Y; i++) {
            int result = 0;
            for (int j = 0; j < X; j++) {
                if (vali[i][j] == sym) result++;
            }
            if (result == voit) return true;
        }
        for (int i = 0; i < Y; i++) {
            int result = 0;
            for (int j = 0; j < X; j++) {
                if (vali[j][i] == sym) result++;
            }
            if (result == voit) return true;
        }
        int esimenediag = 0;
        for (int i = 0; i < Y; i++) {
            for (int j = 0; j < X; j++) {
                if(j == i && vali[i][j] == sym) esimenediag++;
            }
        } 
        if (esimenediag == voit) return true;
        int teinediag = 0;
        for (int i = 0; j = Y; i < X && j > 0; i++, j--) {
            if (vali[i][j] == sym) teinediag++;
        }
        if (teinediag == voit) return true;
        return false;
    }    
}
