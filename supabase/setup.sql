-- LearnVestor website: waitlist and feedback.
--
-- Run once in a Supabase project: Dashboard > SQL Editor > paste this file > Run.
-- Safe to run again (it recreates the functions and keeps the data).
--
-- The website calls two RPCs with the project's public (publishable/anon) key:
--   join_waitlist(p_email, p_locale, p_source)
--   submit_feedback(p_message, p_email, p_source, p_locale)
-- Visitors can only insert through these functions. The tables are not readable or
-- writable through the API; read them in the Dashboard (Table Editor) or SQL Editor.

-- Waitlist ---------------------------------------------------------------------------------

create table if not exists public.waitlist_signups (
  id         bigint generated always as identity primary key,
  email      text not null unique
             check (email = lower(email) and length(email) <= 254 and email ~ '^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  locale     text,
  source     text,
  created_at timestamptz not null default now()
);

alter table public.waitlist_signups enable row level security;

-- Always succeeds for a well-formed email (also when already registered), so the endpoint
-- cannot be used to discover who is on the list.
create or replace function public.join_waitlist(p_email text, p_locale text default null, p_source text default 'website')
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_email text := lower(trim(p_email));
begin
  if v_email is null or length(v_email) > 254 or v_email !~ '^[^\s@]+@[^\s@]+\.[^\s@]+$' then
    raise exception 'invalid_email';
  end if;
  -- Crude flood guard for a public endpoint.
  if (select count(*) from public.waitlist_signups where created_at > now() - interval '1 minute') >= 30 then
    raise exception 'rate_limited';
  end if;
  insert into public.waitlist_signups (email, locale, source)
  values (v_email, left(p_locale, 10), left(p_source, 40))
  on conflict (email) do nothing;
end;
$$;

-- Feedback ---------------------------------------------------------------------------------

create table if not exists public.feedback (
  id         bigint generated always as identity primary key,
  message    text not null check (char_length(message) between 1 and 2000),
  -- Optional, only if the visitor wants an answer.
  email      text check (email is null or (length(email) <= 254 and email ~ '^[^\s@]+@[^\s@]+\.[^\s@]+$')),
  source     text,
  locale     text,
  created_at timestamptz not null default now()
);

alter table public.feedback enable row level security;

create or replace function public.submit_feedback(
  p_message text,
  p_email text default null,
  p_source text default 'website',
  p_locale text default null)
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_message text := trim(p_message);
  v_email text := nullif(lower(trim(p_email)), '');
begin
  if v_message is null or char_length(v_message) = 0 or char_length(v_message) > 2000 then
    raise exception 'invalid_message';
  end if;
  if v_email is not null and (length(v_email) > 254 or v_email !~ '^[^\s@]+@[^\s@]+\.[^\s@]+$') then
    raise exception 'invalid_email';
  end if;
  if (select count(*) from public.feedback where created_at > now() - interval '1 minute') >= 30 then
    raise exception 'rate_limited';
  end if;
  insert into public.feedback (message, email, source, locale)
  values (v_message, v_email, left(p_source, 40), left(p_locale, 10));
end;
$$;

-- API surface ------------------------------------------------------------------------------
-- Supabase grants new tables and functions to the API roles by default: take everything
-- back and allow only the two functions.

revoke all on table public.waitlist_signups, public.feedback from anon, authenticated;
revoke all on function public.join_waitlist(text, text, text) from public, anon, authenticated;
revoke all on function public.submit_feedback(text, text, text, text) from public, anon, authenticated;
grant execute on function public.join_waitlist(text, text, text) to anon, authenticated;
grant execute on function public.submit_feedback(text, text, text, text) to anon, authenticated;
