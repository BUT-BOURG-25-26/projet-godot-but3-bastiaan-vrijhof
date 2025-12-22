[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/SH0JJH6F)
### Nom des étudiants du groupe :
- **Bastiaan VRIJHOF**

# Godot Infinite Runner 3D

## Fonctionnalités Principales

### Gameplay
* **Système de 3 Voies (Lanes) :** Déplacements latéraux fluides (Gauche / Milieu / Droite).
* **Contrôles Tactiles (Mobile) :** Gestion complète des gestes "Swipe" (Glisser) pour bouger et sauter.
* **Contrôles Clavier (Debug PC) :** Support des flèches directionnelles pour tester sur ordinateur.
* **Difficulté Progressive :** La vitesse de course augmente constamment au fil du temps.
* **Système de Mort :** Détection précise des collisions avec les obstacles (Game Over instantané).

### Génération Procédurale
* **Monde Infini :** Apparition et suppression des parcelles de terrain.
* **Logique de Spawn Intelligente :**
    * Début de partie sécurisé (5 premières parcelles sans obstacles).
    * Alternance aléatoire entre zones sûres et zones à obstacles par la suite.
* **Environnement :** Skybox panoramique (HDRI).

### Score & Progression
* **Calcul de Distance :** Score basé sur les mètres parcourus (influence de la vitesse).
* **High Scores (Meilleurs Scores) :**
    * Sauvegarde persistante des données sur le disque (`user://`).
    * Tableau des 10 meilleurs scores affiché dans le menu principal.

### Interface (UI)
* **Menu Principal :** Boutons Jouer, Meilleurs Scores, Quitter.
* **HUD en Jeu :** Affichage de la distance parcourue en temps réel.
* **Écran Game Over :** Panneau overlay avec Game Over et retour au menu.
* **Responsive Design :** Interface adaptative qui s'ajuste aux différentes tailles d'écrans mobiles.

### Audio
* **Ambiance :** Musique de fond en boucle.
