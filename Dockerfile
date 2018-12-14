FROM nginx
#rinomina il file di configurazione esistente
RUN mv /etc/nginx/conf.d/default.conf default.conf.orig
#copia il file di configurazione personalizzato nella cartella
COPY default.conf /etc/nginx/conf.d