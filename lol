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
        System.out.println("instruction");
        while (true) {
            mangijaSamm();
            printVali();
            if (kasvoit(mangija)) {
                System.out.println("Mängija on võitnud");
                break;
            }
            if(vabakoht()) {
                System.out.println("Viik");
                break;
            }
            tiSamm();
            System.out.println();
            printVali();
            if(kasvoit(TI)) {
                System.out.println("Arvuti on võitnud");
                break;
            }
            if(vabakoht()) {
                System.out.println("Viik");
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
    static void mangijaSamm () {
        int x, y;
        do {
            System.out.println("Sisestage koordinaadid: ");
            x = s.nextInt() - 1;
            y = s.nextInt() - 1;
        } while (!kasTehaSamm(x, y));
        vali[y][x] = mangija;
    }
    static void tiSamm(){
        int x, y;
        do {
            x = suv.nextInt(X);
            y = suv.nextInt(Y);
        } while (!kasTehaSamm(x, y));
        vali[y][x] = TI;
    }
    static boolean kasTehaSamm (int x, int y) {
        if (x < 0 || x >= X || y < 0 || y >= Y) return false;
        if (vali[y][x] == tuhi) return true;
        return false;
    }
    static boolean vabakoht() {
        for (int i = 0; i < Y; i++) {
            for (int j = 0; j < X; j++) {
                if(vali[i][j] == tuhi) return false;
            }
        }
        return true;
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
        for (int i = 0, j = Y - 1; i < X && j >= 0; i++, j--) {
            if (vali[i][j] == sym) teinediag++;
        }
        if (teinediag == voit) return true;
        return false;
    }
}
