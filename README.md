# Automatisation du changement de fond d'écran sous Windows

Ce projet permet de **changer automatiquement le fond d’écran de Windows selon l’heure de la journée (6h, 11h, 18h et 22h)** sans installer de logiciel tiers.  
Le script utilise PowerShell et le planificateur de tâches Windows.

## Fonctionnalités
- Change le fond d’écran automatiquement selon la tranche horaire :
  - **06h – 11h** → `morning.jpg`
  - **11h – 18h** → `day.jpg`
  - **18h – 22h** → `night.jpg`
  - **22h – 06h** → `late_night.jpg`
Vous pouvez modifier les images de fond d'écran à votre convenance.

## Structure du projet
```
📦 Automatic_Windows_Background
 ┣ 📂 Images
 ┃ ┣ morning.jpg
 ┃ ┣ day.jpg
 ┃ ┣ night.jpg
 ┃ ┗ late_night.jpg
 ┣ 📂 Others
 ┣ ChangeWallpaper.ps1
 ┣ LICENSE
 ┗ README.md
```

## Configuration

### 1. Crée le dossier du projet
Place le dossier `Automatic_Windows_Background` où tu veux (ex. dans `C:Users\<pseudo>\Pictures`).

### 2. Copie tes fonds d’écran
Place tes images dans le dossier `Images/` et assure-toi qu’elles portent les bons noms :
```
morning.jpg, day.jpg, night.jpg, late_night.jpg
```
Possibilité de changer l'extension .jpg et d'en utiliser une autre, mais il faut également changer le script.

### 3. Vérifie le script
Ouvre le fichier `ChangeWallpaper.ps1` et modifie si besoin le chemin d'accès aux photos :
```powershell
$wallpaperPath = Join-Path $PSScriptRoot "Images"
```

### 4. Teste manuellement
Ouvre PowerShell et exécute :
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Chemin\Vers\Automatic_Windows_Background\ChangeWallpaper.ps1"
```
Le fond d’écran doit changer selon l’heure actuelle.

## Automatisation avec le Planificateur de tâches

1. Ouvre le **Planificateur de tâches** (`taskschd.msc`).
2. Clique sur **Créer une tâche...**
3. **Onglet Déclencheurs** → ajoute ces déclencheurs : 06:00, 11:00, 18:00, 22:00  
4. **Onglet Actions** → choisis :
   - Programme/script : `powershell`
   - Arguments :  
     ```
     -ExecutionPolicy Bypass -File "C:\Chemin\Vers\Automatic_Windows_Background\ChangeWallpaper.ps1"
     ```
5. Sauvegarde la tâche.

Le fond d’écran changera automatiquement selon l’heure de la journée !!

---
Tu peux personnaliser les heures ou ajouter d’autres périodes (ex. “sunset”, “midday”) en modifiant les conditions `if` dans le script (ne pas oublier de modifier la tâche dans le **Planificateur de tâches** ;) ).
