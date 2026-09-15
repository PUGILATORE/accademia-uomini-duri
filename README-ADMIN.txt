NOI UOMINI DURI — AREA ADMIN

1) NON modificare index.html: l'aspetto pubblico resta invariato.
2) admin.html è la pagina privata per gestire le candidature.
3) admin.html usa lo stesso supabase-config.js di index.html.
4) Prima di usarla, crea un utente in Supabase:
   Authentication -> Users -> Add user / Create user
   Usa l'email e la password che vuoi utilizzare per l'area amministrativa.
5) Esegui in Supabase SQL Editor il file:
   supabase-schema-admin.sql
   Questo aggiunge le policy RLS per utenti autenticati.
6) Apri admin.html. Inserisci email e password dell'utente Supabase creato.
7) Potrai vedere le candidature e cambiare lo stato:
   NUOVA
   DA CONTATTARE
   COLLOQUIO
   ACCETTATA
   RIFIUTATA
   CONFERMATA

SICUREZZA
- Il browser pubblico usa solo la Publishable/anon key.
- La tabella non ha SELECT pubblico: un candidato non può leggere le candidature.
- La lettura e l'aggiornamento sono consentiti solo a utenti autenticati.
- NON inserire mai una service_role/secret key in index.html o admin.html.

NOTA
La policy "authenticated" permette l'accesso a qualunque utente Auth del progetto. Per una installazione con un solo account amministratore è sufficiente non creare altri utenti Auth. Se in futuro vorrai più ruoli, si può restringere la policy a uno specifico account/ruolo.
