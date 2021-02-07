# 5BIM

CreatingImagette.m : Ce code permet de découper la grosse image en petites imagettes, et de les stocker dans un dossier.

ShowOnMap.m : Ce code permet d'afficher les imagettes qui contiennent des contaminants sur l'images principale sous forme de carré de couleur. Chaque couleur correspond à un contaminant.

Sift.mlx : Ce notebook contient le code pour faire fonctionner la méthode de détection des carcasses par la méthode Sift. Il détaille le raisonnement suivi et les différents résultats obtenus par cette approche.

train_Modèle_sans_DA_Conta_Autre.ipynb : Ce notebook permet de créer des modèles de CNN à l'aide de ResNet 50 avec deux classes, les contaminants et les autres images. Il n'y a pas de Data-Augmentation.

train_Modèle_avec_DA_Conta_Autre.ipynb : Ce notebook permet de créer des modèles de CNN à l'aide de ResNet 50 avec deux classes, les contaminants et les autres images. Il de la Data-Augmentation pour les images d'entrainement et de validation.

tri_DL.ipynb : Permet à partir d'un dossier contenant les deux classes d'images, de les répartir de sorte à avoir des dossiers d'entrainement, validation et de test. Cette disposition des données est obligatoire pour faire les CNN.

Supression_Autre.ipynb :  Permet de diviser par deux le nombre d'images dans les dossier "Autres" car il contient 10 fois plus d'image que ceux de "Contaminants"




