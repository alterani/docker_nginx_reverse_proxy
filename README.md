# docker_nginx_reverse_proxy
Creare un docker nginx configurato per il reverse proxy



### Creo container nginx di default i
```
docker run -d --name nginx-default nginx
```

### mi collego all’interno del container nginx via shell (riga di comando)

```
bash -c "clear && docker exec -it nginx-default sh"
```

### Appena dentro il docker mi sposto nella cartella di configurazione nginx quindi:
```
cd /etc/nginx/conf.d
```

### appena dentro visualizzare il contenuto del file default.conf
```
cat default.conf
```

### Comiare il contenuto del file default.conf in un editor locale per poi modificarlo

fare copia dal terminale e incolla in un editor di testo es. sublime

### nel file aggiungere la location/app a cui puntare

esempio:

```
location /odoo1 {
        proxy_pass odoo1:8069;
    }
```
in questo caso odoo1 è il nome del container e la relativa porta.

### Configurazione Dockerfile
Adesso creiamo il docker file con questo contenuto:

```
FROM nginx
#rinomina il file di configurazione esistente
RUN mv /etc/nginx/conf.d/default.conf default.conf.orig
#copia il file di configurazione personalizzato nella cartella
COPY default.conf /etc/nginx/conf.d
```

### Creazione nuova immagine
A questo punto siamo pronti per creare la nuova immagine che all'interno
conterrà il nostro file di configurazione default.conf





  

