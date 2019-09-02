# 50 sfumature di Pentaho Data Integration (KETTLE per i nostalgici)

Questo documento vuole essere un elenco di esperimenti, ricette, e casi strani
raggruppati per cartella su Pentaho Data Integration (PDI da ora in poi o KETTLE per 
chi ha un po di anni di ETL alle spalle) a partire dalla versione 8+

## Prima di cominciare

### Documentazione
La documentazione ufficiale la trovi 
https://help.pentaho.com/Documentation
Non è il massimo della chiarezza però e quella ufficiale.

Si trova molta documentazione sparsa in giro allego qualche link che mi ha aiutato in momenti difficili:
https://e-l.unifi.it/pluginfile.php/567662/mod_resource/content/1/IntroPentahoDataIntegrationKettle_AB.pdf

### Libiri (letti)
Qualche libro che ho letto:
- Learning Pentaho Data Integration 8 CE - Third Editio
- Pentaho 8 Reporting for Java Developers

### Comunity
- Quella ufficiale la trovi a questo link https://community.hitachivantara.com/s/
- https://forums.pentaho.com/forums/259-Italian/


## Ricette
Un elenco sparso di appunti presi durante questi anni di utilizzo dello strumento.


### Dove scaricare PDI (Kettle per i nostalgici...)
A questo indirizzo trovare la versione commerciale e l'azienda che lo supporta (lasciate perdere)
https://www.hitachivantara.com/

A questo indirizzo trovare quello che vi serve
https://sourceforge.net/projects/pentaho/files/


PDI è un applicativo client che trovi a questo indirizzo
https://sourceforge.net/projects/pentaho/files/Pentaho%208.3/client-tools/

Radunare 50 esempi di soluzioni ideate da me e da giovanni con kettle su github

### installare i driver
Purtroppo per questioni di licenze PDI non comprende molti driver che debbono essere installati a mano:




### DECRIPT DELLA PASSWORD SALVATE NEI FILE KETTLE

```javascript
password_decrypt/password_decrypt.ktr
```


Nello Step di Input si utilizza un Generate Rows e si assegna ad una variabile la password da decriptare. 
Nel secondo Step si utilizza un Modified Java Script Value per creare un nuovo field ed assegnare il valore decriptato.
Da Java Script e' possibile richiamare tutte le classi di Kettle, tra cui quelle di decrypting. 
Nello step di output si salva il risultato su file. Il codice Java Script necessario e':


ATTENZIONE:
usare lo stesso pdi  o un pdi con la stessa secret key
https://wiki.pentaho.com/display/EAI/Secret+Key+Generator


```javascript
\\Effettua il decrypt della password impostata nello Step precedente
var decr=org.pentaho.di.core.encryption.Encr.decryptPassword(pass);
```

Fonti:
http://diethardsteiner.github.io/pdi/2017/03/03/PDI-Password-Encryption.html
http://diethardsteiner.github.io/pdi/2017/03/03/PDI-Password-Encryption.html


### TODO

Elenco dei prossimi argomenti


- come trovare il collo di bottiglia: utilizzando il dummy ed interrompendo il flusso, 

- esempio aumentare le performaces: https://anonymousbi.wordpress.com/2012/03/28/improving-performance-with-pentaho-data-integration-kettle-table-input-step-and-oracle-databases/

- esempio il caricamento merge di due db in uno fatto dal penna

- consigli per collegarsi con il service name https://communities.bmc.com/thread/141761?start=0&tstart=0

- come allineare le sequence in oracle dopo l'importazione (chiedi al penna).

- script su windows per unzip e zip prpt per i report pentaho

- blocking step non funziona quando deve bloccare un table input
  https://forums.pentaho.com/threads/83372-delay-execution-of-an-input-table-step-after-execution-of-an-update-table-step/ 
    esempio voglio fare delgi inserimenti su una tabella padre e poi gli inserimenti su una tabella figlia, utilizzando il 
    blocking step non blocco il secondo table input poichè IL TABLE INPUT SE NON HA PARAMETRI DI INPUT che non gli arrivano 
    inizia subito.
    
    
    


- per chiamare una procedura in oracle creare una funzione che invoca il package, 
 in altri modi non funziona tariffazione_ricette_stato_f.ktr



- come utilizzare il JNDI con kettle, pentaho server, pentaho report designer

- Pentaho Spoon - ORA-12505 "No SID" Error When trying to connect to an Oracle DB
Errore connessione oracle se non si usa il service name
-https://communities.bmc.com/thread/141761?start=0&tstart=0
usare solo il campo "Database Name" inserendo la dicitura da tnsnames.ora
(DESCRIPTION =(ADDRESS = (PROTOCOL = TCP)(HOST =xxx.xxx.xxx.xxx)(PORT = xxxx))(CONNECT_DATA =(SERVER = DEDICATED)(SERVICE_NAME =xxxx)))  

 
