let choix = confirm("Voulez vous jouer ?");

if (choix==true) {

    let age = prompt("Quel est votre âge ?");
    
    age = parseInt(age) + 10;
    
    alert("Dans 10 ans vous aurez " + age + " ans");

}
else {
    alert("Dommage !!!")
}