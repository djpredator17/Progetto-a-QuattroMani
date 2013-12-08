
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