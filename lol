public class Final {
    public static void main(String[] args) {

    }
}
class Vaataja {
    private String nimi;
    private int vanus;
    private double summa;

    Vaataja(String vaatajaNimi, int vaatajaVanus) {
        nimi = vaatajaNimi;fsfs    }
    public String getNimi(){
        return nimi;
    }
    public void setNimi(String nimi) {
        this.nimi = nimi;
    }
    public double getSumma(){
        return summa;
    }
    public void setSumma(double summa) {
        this.summa = summa;
    }
    public int getVanus() {
        return vanus;
    }
    public void setVanus(int vanus){
        this.vanus = vanus;
    }
    public String toString() {
        return "(" + nimi + ";" + vanus + ";" + summa + ")";
    }

}


class Teatrietendus {
    private String pealkiri;
    private double hind;
    private int arv;
    Teatrietendus(String etendusePealkiri, double piletiHind, int kohtadeArv) {
        pealkiri = etendusePealkiri;
        hind = piletiHind;
        arv = kohtadeArv;
    }
}
class Suvelavastus {

}
interface Elamus {
   boolean saabElamuse();
}
