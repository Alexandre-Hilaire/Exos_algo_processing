void setup () {
  String [] students = {"Paul", "Vincent", "Mélissa", "Alexis", "Tarik", "Marlène", "Sarah", "Théo", "Yannis", "Térence", "Yannick", "Steve", "Mati", "Karl", "Dimitri"}; //<>//
  String [] agile = {"Marcelline", "Yannick","Sarah", "Mélissa", "Paul", "Guillaume", "Dimitri", "Marlène", "Yannis"};
  String [] php = {"Yannick", "Karl", "Jean-Marc", "Térence", "Sarah"};
  String [] js = {"Yannick", "Tarik", "Marlène", "Sarah", "Alexis", "Vincent", "Yannis", "Karl", "Mati", "Térence", "Paul", "Dimitri", "Mélissa", "Théo"};

  //Pour les participants à la conférence méthode Agile
  
  println(affiche_tableau(agile), "participent à la conférence méthode Agile");
  
  //Pour vérifier la présente ou l'absence de théo à la conférence PHP
  
  if (array_comparison_theo(php, students) == true) {
    println("Théo était présent à la conférence PHP");
  }
  else {
    println("Théo n'était pas présent à la conférence PHP");
  }
 
  // Le nombres et le noms des absents à la conférence js
   int number_missing_at_js =0;
   String [] people_name_missing_at_js = {};
   
   for (int i=0; i<students.length; i++){
     if (presents_people_at_conf(js, students[i]) == false){
       number_missing_at_js++;
       people_name_missing_at_js = append(people_name_missing_at_js, students[i]);
     }
   }
   
   println("Le nombre et le nom des absents à la conférence js sont");
   println("Nombre : ", number_missing_at_js);
   println(affiche_tableau(people_name_missing_at_js), "est/sont absents à la conférence méthode Agile");
  
}

// Le nom des étudiants qui ont participé à la conférence agile et absents à la conférence php


//Fonction d'affichage d'un tableau
String affiche_tableau (String [] tab) {
  String name = "";
  for (int i = 0; i < tab.length; i++) {
     name = name + tab[i] + ", "; 
  }
  return name;
}

// Fonction pour vérifier la présence de théo

boolean array_comparison_theo(String [] tab1, String [] tab2) {
  boolean result = false;
  for (int i = 0; i< tab1.length; i++)
    if (tab1[i].equals(tab2[8]) == true){
      result = true;
    }
  return result;
}


//Fonction pour tester la présence à une conférence
boolean presents_people_at_conf(String [] tab1, String name) {
  boolean presents = false;
  int i=0;
  while (presents != true && i < tab1.length) {
      if (tab1[i].equals(name) == true){
        presents = true;
      }
      else {
        presents = false;
      }
      i++;
  }
  return presents;
}



void draw() {
 exit(); 
}
