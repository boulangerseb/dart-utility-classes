import 'dart:math';

class Statistics {

  static num moyenne(List list) {
    num result = 0;
    list.forEach((e) {
      result += e;
    });
    result = result / list.length;
    return result;
  }

  static num ecartType(List list) {
    num result = 0;
    num listMoyenne = moyenne(list);
    list.forEach((e) {
      result += ((e - listMoyenne) * (e - listMoyenne));
    });
    result = sqrt(result / list.length);
    return result;
  }

  static int factorielle(int n) {
    n = n.abs();
    if( 0 == n ){
      return 1;
    }else{
      return n*factorielle(n-1);
    }
  }

  static int factoLimit(int n, int r) {
    //n = taille du set
    //r = taille de l'échantillon
    n = n.abs();
    r = r.abs();
    if( r != 1 ){
      return n*factoLimit(n-1,r-1);
    }else{
      return n;
    }  
  }

  static int permutation(int n, int r) {
    n = n.abs();
    r = r.abs();
    return (factoLimit(n,r) / factorielle(r)).round();  
  }

}