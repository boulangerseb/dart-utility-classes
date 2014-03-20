import 'dart:mirrors';

class ListTools {

  static bool compareLists(List list1, List list2) {
    if (list1.length != list2.length){
      return false;
    }
    for (int i = 0, leni = list1.length; i < leni; i++) {
      if (list1[i] is List && list2[i] is List) {
        if (!compareLists(list1[i],list2[i])) {
          return false;
        }
      } else if (list1[i] != list2[i]) {
        return false;      
      }
    }
    return true;
  }

  static List intersectLists(List list1, List list2) {
    int length1 = list1.length,
        length2 = list2.length,
        v = 0,
        v2 = 0,
        j = 0,
        l2 = (length1 > length2) ? length1 : length2;
    List r = new List();
    for (int i = 0, leni = (length1 > length2) ? length2 : length1; i < leni; i++) {
      v = (length1 > length2) ? list2[i] : list1[i];
      for (j = 0; j < l2; j++) {
        v2 = (length1 > length2) ? list1[j] : list2[j];
        if( v == v2 ){
          r.add(v);
          break;
        }      
      }
    }
    return r;
  }
  
  static List getFlatList(List list) {
    List internalList = new List();
    list.forEach((e) {
      if (e is List) {
        internalList.addAll(getFlatList(e));
      } else {
        internalList.add(e);
      }
    });
    return internalList;
  }

  static List divideInSubLists(List list, int diviser) {
    List _list = new List();
    int maxRange = 0;
    int iterations = (list.length / diviser).ceil();
    int leni = list.length;
    for (int i = 0; i < iterations; i++) {
      maxRange = (leni > (i*diviser)+diviser) ? (i*diviser)+diviser : leni;
      _list.add(list.getRange(i*diviser,maxRange).toList());
    }
    return _list;
  }
  
  static bool isContainsList(List container, List contained) {
   bool b = false;
   for (int i = 0, leni = container.length; i < leni; i++) {
     if (compareLists(container[i],contained)) {
       b = true;
       break;
     }     
   }
   return b;
  } 
}