> # On définit les noms des candidats dans une variable nommée « col1 »
> col1 <- c("Macron", "Melenchon", "Le Pen", "Pecresse")
> 
> # On reprend les % de vote issus de l’extraction précédente, dans une variable nommée « col2 »
> col2 <- c(mean(voteCandidats1_4$Part_Macron), mean(voteCandidats1_4$Part_Melenchon),
+           mean(voteCandidats1_4$Part_LePen), mean(voteCandidats1_4$Part_Pecresse))
> 
> # On crée le tableau de données du graphique en spécifiant que les valeurs du graph correspondent à « col2 »
> data <- data.frame(group=col1, value=col2)
> 
> # On crée le graphique :
> ggplot(data, aes(x="", y=value , fill=group)) 
     geom_bar(stat="identity", width=1) +
     geom_col() +
     coord_polar("y", start=0) +
     
     # On ajoute les valeurs de % de vote sur le graph et on personnalise les couleurs
     geom_text(aes(label = round(value, digits=2)), position = position_stack(vjust = 0.5)) +
     scale_fill_manual(values = c("#0a3895", "#b831f3",
                                  "#f33157", "#6091f6"))




> # On définit les noms des candidats dans une variable nommée « col1 »
> col1 <- c("Macron", "Melenchon", "Le Pen", "Pecresse")
> 
> # On reprend les % de vote issus de l’extraction précédente, dans une variable nommée « col2 »
> col2 <- c(mean(voteCandidats1_4$Part_Macron), mean(voteCandidats1_4$Part_Melenchon),
           mean(voteCandidats1_4$Part_LePen), mean(voteCandidats1_4$Part_Pecresse))
> 
> # On crée le tableau de données du graphique en spécifiant que les valeurs du graph correspondent à « col2 »
> data <- data.frame(group=col1, value=col2)
> 
> # On crée le graphique :
> ggplot(data= data, aes(x=reorder(group, -value), y=value, fill=group)) +
     geom_bar(stat="identity")+
     
     # On ajoute les valeurs de % de vote sur le graph et on personnalise les couleurs
     geom_text(aes(label=round(value, digits=2)), vjust=1.6, color="white", size=3.5)+
     scale_fill_manual(values = c("#0a3895", "#b831f3","#f33157", "#6091f6"))




> # On définit les noms des candidats dans une variable nommée « col1 »
> voteCandidats_LaRochelle <- resultats_pres2022[resultats_pres2022$Libelle == "La Rochelle",]
> col1 <- c("Hidalgo", "Melenchon", "Jadot")
> 
> # On reprend les % de vote issus de l’extraction précédente, dans une variable nommée « col2 »
> col2 <- c(mean(voteCandidats_LaRochelle$Part_Hidalgo), mean(voteCandidats_LaRochelle$Part_Melenchon),
           mean(voteCandidats_LaRochelle$Part_Jadot))
> 
> # On crée le tableau de données du graphique en spécifiant que les valeurs du graph correspondent à « col2 »
> data <- data.frame(group=col1, value=col2)
> 
> # On crée le graphique :
> ggplot(data, aes(x="", y=value , fill=group)) +
     geom_bar(stat="identity", width=1) +
     geom_col() +
     coord_polar("y", start=0) +
     
     # On ajoute les valeurs de % de vote sur le graph et on personnalise les couleurs
     geom_text(aes(label = round(value, digits=2)), position = position_stack(vjust = 0.5)) +
     scale_fill_manual(values = c("#0a3895", "#b831f3",
                                  "#f33157"))




> # On reformatte le tableau de données (nécessite le package tidyr)
> reformat <- voteRochefort_Candidats1_4 %>% pivot_longer(cols=c("Part_Macron", "Part_LePen", "Part_Melenchon", "Part_Pecresse"), names_to='candidats', values_to='parts')
> 
> # On réalise autant de graphs qu’il existe de Bureaux de vote (« facet_wrap »)
> ggplot(data=reformat, aes(x=candidats,y=parts,fill=candidats)) +
+     geom_bar(stat="identity") +
+     facet_wrap(~Code_BV) +
+     ggtitle("Parts de vote dans les BV de Rochefort") +
+     theme(plot.title = element_text(family="Trebuchet MS", face="bold", size=20, hjust=0, color="#555555")) +
+     theme(axis.text.x = element_text(angle=90)) +
+     scale_fill_manual(values = c("#0a3895", "#b831f3","#f33157", "#6091f6"))