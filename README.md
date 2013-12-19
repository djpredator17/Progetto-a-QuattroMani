----------
19/12/2013 18:13
Ciao, scusami se non mi sto facendo sentire solo adesso, ma ultimamente non ho avuto tempo per affrontare questa cosa... ma tu hai trovato altre persone disposte ad integrare con qualche idea magari più concreta per quanto riguarda la parte sia grafica che di progettazione del database?

Saluti a presto.

----------
12/12/2013 23:00

Ho fatto un po' di cose in questi giorni, ho setuppato il database (e aggiornato il dump che trovi nella root) e unito i due controller che avevo creato per il controllo del login (via facebook e via registrazione)
Sto cercando di capire come fare a far funzionare il tutto senza /index.php/ nelle URL ma anche se modifico l'.htaccess mi dà errori 404 a manetta :/


----------
09/12/2013 10:05

Ammazza fino alle 03.40 O___O, complimenti! Sei un grande!

Esamino il tutto e vediamo un po che conclusioni riesco a tirare fuori... gli altri li hai sentiti?

Buon Riposo! :)

P.S Appena ci sei dimmi che modifiche hai apportato... magari la prossima volta quando modifichiamo qualcosa e committiamo ci mettiamo dei segnaposto :)

----------
08/12/2013 03:40

Dopo una lunga notte ho concluso alcune cose interessanti.
Ho giocato con la classe di esempio di CodeIgniter, ho lasciato il codice in modo che possa provarlo anche tu.
Nel commit ho escluso il manuale utente, che puoi trovare online qui (http://ellislab.com/codeigniter/user-guide/)

Ho recuperato la SDK per PHP di Facebook (https://developers.facebook.com/docs/reference/php/), l'ho inserita nelle librerie di CodeIgniter
e ho usato le funzioni base per loggare/fare il logout/recuperare le informazioni dell'utente. Ho anche creato una tabella nel database
con i dati corrispondenti a quelli recuperati con l'API di Facebook, e il codice per l'inserimento automatico dei dati del profilo funziona.

Il nome della classe è "Fb", ci accedi normalmente con "www.dominio.com/index.php/fb"

I file che ho modificato sono:
- application/config/database.php
- application/controllers/fb.php
- application/libraries/facebook.php
- application/libraries/base_facebook.php
- application/models/fb_model.php
- application/views/fb/
- application/views/templates

In più trovi il dump del mio database locale nella root del progetto.

