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
   
   for (int i=0; i < students.length; i++){
     if (presents_people_at_conf(js, students[i]) == false){
       number_missing_at_js++;
       people_name_missing_at_js = append(people_name_missing_at_js, students[i]);
     }
   }
   
   println("Le nombre et le nom des absents à la conférence js sont");
   println("Nombre : ", number_missing_at_js);
   println(affiche_tableau(people_name_missing_at_js), "est/sont absents à la conférence js");
  

// Le nom des étudiants qui ont participé à la conférence agile et absents à la conférence php

  
  //On vérifie les absence de la conférence php
  String [] people_name_missing_at_php = {};
   
   for (int i=0; i < students.length; i++){
     if (presents_people_at_conf(php, students[i]) == false){
       people_name_missing_at_php = append(people_name_missing_at_php, students[i]);
     }
   }
  // On se sert de la même fonction pour vérifier les points communs
  
  String [] people_name_missing_at_php_and_presents_at_agile = {};
   
   for (int i=0; i < people_name_missing_at_php.length; i++){
     if (presents_people_at_conf(agile, people_name_missing_at_php[i]) == true){
       people_name_missing_at_php_and_presents_at_agile = append(people_name_missing_at_php_and_presents_at_agile, people_name_missing_at_php[i]);
     }
   }
   
   println("Les étudiants qui ont participés à la conférence agile et sont absents de php sont");
   println(affiche_tableau(people_name_missing_at_php_and_presents_at_agile));
 
// le nom des participants à la conférence Agile qui ne sont pas des étudiants

  //On utilise la même fonction mais cette fois on inverse on demande les noms dans agile qui ne sont pas présents dans students
  String [] people_not_students_at_agile = {};
  
    for (int i=0; i < agile.length; i++){
      if (presents_people_at_conf(students, agile[i]) == false){
        people_not_students_at_agile = append(people_not_students_at_agile, agile[i]);
      }
    }
   
   println("Les personnes qui assistent à la conférence agile sans êtres étudiants");
   println(affiche_tableau(people_not_students_at_agile));
   
//le nom des étudiants qui ont participé à tous les évènements

  //On appelle la fonction de comparaison de tableau 3 fois et on ne garde que si les 3 résultats sont vrai 
  
  String [] people_present_at_all_conf = {};
  String [] people_not_present_at_all_conf = {};
   
   for (int i=0; i < students.length; i++){
     if (presents_people_at_conf(agile, students[i]) == true && presents_people_at_conf(php, students[i]) == true && presents_people_at_conf(js, students[i]) == true ){
       people_present_at_all_conf = append(people_present_at_all_conf, students[i]);
     }
     //le nom des étudiants qui n’ont jamais assisté à un évènement est juste l'inverse, si les 3 résultats sont false
     else if (presents_people_at_conf(agile, students[i]) == false && presents_people_at_conf(php, students[i]) == false && presents_people_at_conf(js, students[i]) == false ) {
       people_not_present_at_all_conf = append(people_not_present_at_all_conf, students[i]);
     }
   }
  
  println("Les étudiants présents à toutes les conférences sont");
  println(affiche_tableau(people_present_at_all_conf));
  println("Les étudiants qui n'ont assistés à aucunes conférences sont");
  println(affiche_tableau(people_not_present_at_all_conf));
  
//la liste des étudiants avec le nombre de participations à des événements
  //On utilise la fonction pour vérifier la présence 3 fois avec un compteur puis on affiche le résultat
  int presents = 0;
  for (int i=0; i < students.length; i++){
    if (presents_people_at_conf(agile, students[i]) == true ){
      presents++;
    }
    if (presents_people_at_conf(php, students[i]) == true){
      presents++;
    }
    if (presents_people_at_conf(js, students[i]) == true) {
      presents++;
    }
    println(students[i], " à participé.e à", presents, " conférences");
    presents = 0;
  }
  
   
} //Fin du programme


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


//Fonction pour tester la présence à une conférence ou comparer deux tableaux de noms
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
