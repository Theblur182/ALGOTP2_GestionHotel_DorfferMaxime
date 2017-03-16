--Nombre de clients
select count (distinct CLI_ID)
from CLIENT ;

--Les clients triés sur le titre et le nom
select *
from CLIENT
ORDER BY TIT_CODE, CLI_NOM;

--Les clients triés sur le libellé du titre et le nom
select *
from CLIENT, TITRE
ORDER BY TIT_LIBELLE, CLI_NOM;

--Les clients commençant par 'B'
select *
from CLIENT
where CLI_NOM like '_B%';

--Les clients homonymes
select count (*), CLI_NOM
from CLIENT
GROUP BY CLI_NOM
having count(*)>1;

--Nombre de titres différents
select count (distinct TIT_CODE)
from CLIENT;

--Nombre d'enseignes
select count (distinct CLI_ENSEIGNE)
from CLIENT;

--Les clients qui représentent une enseigne 
select * 
from CLIENT
where CLI_ENSEIGNE is not null;

--Les clients qui représentent une enseigne de transports
select *
from CLIENT
where CLI_ENSEIGNE like '%transport%';

--Nombre d'hommes,Nombres de femmes, de demoiselles, Nombres de sociétés____________________________________10
select count (distinct TIT_CODE)
from CLIENT
where TIT_CODE = "M.";

select count (distinct TIT_CODE)
from CLIENT
where TIT_CODE = "Mme.";

select count (distinct TIT_CODE)
from CLIENT
where TIT_CODE = "Melle.";

select count (*) TIT_CODE
from CLIENT
where CLI_ENSEIGNE is not null;

--Nombre d'emails
select count (distinct EML_ID)
from EMAIL ;

--Clients sans email 
select CLI_ID
from CLIENT
where CLI_ID not in	(select CLI_ID
						from EMAIL);
				

--Clients sans téléphone 
select *
from TELEPHONE
where CLI_ID is null;

--Les phones des clients
select CLIENT.CLI_ID as 'Numero', TIT_CODE, CLI_NOM
from CLIENT, TELEPHONE
where CLIENT.CLI_ID = TELEPHONE.CLI_ID;

--Ventilation des phones par catégorie
select
from TELEPHONE
where

--Les clients ayant plusieurs téléphones
select *
from CLIENT
where CLI_ID in (select CLI_ID
					from TELEPHONE
					where TEL_NUMERO => 1);

--Clients sans adresse:
select CLI_ID
from CLIENT
where CLI_ID not in (select CLI_ID
						from ADRESSE);

--Clients sans adresse mais au moins avec mail ou phone 
select CLI_ID
from CLIENT
where CLI_ID not in (select CLI_ID
						from ADRESSE);

--Dernier tarif renseigné
select TRF_DATE_DEBUT
from TARIF
ORDER BY TRF_DATE_DEBUT DESC LIMIT 1

--Tarif débutant le plus tôt_____________________________________________________________________________20
select TRF_DATE_DEBUT
from TARIF
ORDER BY TRF_DATE_DEBUT ASC LIMIT 1

--Différentes Années des tarifs
select TRF_DATE_DEBUT
from TARIF
ORDER BY TRF_PETIT_DEJEUNE

--Nombre de chambres de l'hotel 
select count (distinct CHB_ID)
from CHAMBRE ;

--Nombre de chambres par étage
select count (CHB_ID)
from CHAMBRE;


--Chambres sans telephone
select CHB_ID
from CHAMBRE
where CHB_ID not in (select CHB_POSTE_TEL
						from CHAMBRE);

--Existence d'une chambre n°13 ?
select
from CHAMBRE
where

--Chambres avec sdb
select CHB_ID
from CHAMBRE
where CHB_BAIN <> 0;

--Chambres avec douche
select CHB_ID
from CHAMBRE
where CHB_DOUCHE <> 0;

--Chambres avec WC
select CHB_ID
from CHAMBRE
where CHB_WC <> 0;

--Chambres sans WC séparés
select CHB_ID
from CHAMBRE
where CHB_WC = 0;

--Quels sont les étages qui ont des chambres sans WC séparés ?_____________________________________________30
select
from CHAMBRE
where

--Nombre d'équipements sanitaires par chambre trié par ce nombre d'équipement croissant
select
from CHAMBRE
where

--Chambres les plus équipées et leur capacité
select
from CHAMBRE
where

--Repartition des chambres en fonction du nombre d'équipements et de leur capacité
select
from CHAMBRE
where

--Nombre de clients ayant utilisé une chambre
select count (distinct N_CLI)
from CLIENT
where

--Clients n'ayant jamais utilisé une chambre (sans facture)
select
from CLIENT
where

--Nom et prénom des clients qui ont une facture
select CLI_NOM, CLI_PRENOM
from CLIENT
where CLI_ID in (select CLI_ID
					from FACTURE
					where FAC_ID is not null);

--Nom, prénom, telephone des clients qui ont une facture
select CLI_NOM, CLI_PRENOM
from CLIENT
where

--Attention si email car pas obligatoire : jointure externe
select
from CLIENT
where

--Adresse où envoyer factures aux clients
select
from ADRESSE
where

--Répartition des factures par mode de paiement (libellé)_________________________________________________40
select
from FACTURE
where

--Répartition des factures par mode de paiement 
select
from FACTURE
where

--Différence entre ces 2 requêtes ? 
select
from
where

--Factures sans mode de paiement 
select
from FACTURE
where

--Repartition des factures par Années
select
from FACTURE
where

--Repartition des clients par ville
select
from CLIENT
where

--Montant TTC de chaque ligne de facture (avec remises)
select
from FACTURE
where

--Classement du montant total TTC (avec remises) des factures
select
from FACTURE
where

--Tarif moyen des chambres par années croissantes
select
from CHAMBRE
where

--Tarif moyen des chambres par étage et années croissantes
select
from CHAMBRE
where

--Chambre la plus cher et en quelle année_______________________________________________________________50
select
from CHAMBRE
where

--Chambre la plus cher par année 
select
from CHAMBRE
where

--Classement décroissant des réservation des chambres 
select
from CHAMBRE
order by desc

--Classement décroissant des meilleurs clients par nombre de réservations
select
from CLIENT
order by desc

--Classement des meilleurs clients par le montant total des factures
select
from CLIENT
where

--Factures payées le jour de leur édition
select
from FACTURE
where

--Facture dates et Délai entre date de paiement et date d'édition de la facture
select
from FACTURE
where
