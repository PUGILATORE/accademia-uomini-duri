-- SICUREZZA CANDIDATURE
-- Il sito pubblico può SOLO inserire nuove candidature.
-- L'area admin, dopo login Supabase Auth, può leggere e aggiornare lo stato.

alter table public.candidature enable row level security;

-- Rimuove policy precedenti con gli stessi nomi, se presenti.
drop policy if exists "Permetti inserimento candidature" on public.candidature;
drop policy if exists "Admin legge candidature" on public.candidature;
drop policy if exists "Admin aggiorna stato candidature" on public.candidature;

-- PUBBLICO: INSERT soltanto, con consenso privacy.
create policy "Permetti inserimento candidature"
on public.candidature
for insert
to anon
with check (privacy_consenso = true);

-- ADMIN: qualunque utente autenticato può leggere.
-- Nel tuo progetto crea quindi SOLO l'utente amministratore che vuoi usare per admin.html.
create policy "Admin legge candidature"
on public.candidature
for select
to authenticated
using (true);

-- ADMIN: può aggiornare le candidature.
create policy "Admin aggiorna stato candidature"
on public.candidature
for update
to authenticated
using (true)
with check (true);
