# Waitlist e feedback do website

A waitlist e a caixa de feedback do website gravam num projeto Supabase pequeno, que é só do website. O plano gratuito chega. A demo da app não usa este projeto: corre toda no browser.

## Configurar (uma vez, cerca de 5 minutos)

1. Cria um projeto em https://supabase.com/dashboard. Escolhe a região **UE (Frankfurt)**.
2. Em **SQL Editor**, cola o conteúdo de [`setup.sql`](setup.sql) e carrega em **Run**. Cria as tabelas `waitlist_signups` e `feedback` e as duas funções públicas, `join_waitlist` e `submit_feedback`.
3. Em **Project Settings > API**, copia:
   - o **Project URL** (por exemplo `https://abcdefghijklmnop.supabase.co`);
   - a chave **publishable** (ou `anon`). **Nunca** uses a `secret` / `service_role`.
4. Cola os dois valores no início de [`docs/script.js`](../docs/script.js):
   ```js
   const SUPABASE_URL = 'https://abcdefghijklmnop.supabase.co';
   const SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_...';
   ```
5. Faz commit e push. O GitHub Pages atualiza o site em cerca de um minuto.

A chave publishable é pública por natureza e fica visível no código do site. Com ela, só se consegue chamar as duas funções: ninguém consegue ler a lista de emails nem o feedback.

## Ver as inscrições e o feedback

No Dashboard do Supabase, em **Table Editor**, abre `waitlist_signups` ou `feedback`. Também podes usar o **SQL Editor**:

```sql
select created_at, email, locale, source from waitlist_signups order by created_at desc;
select created_at, source, email, message from feedback order by created_at desc;
```

Na tabela `feedback`, a coluna `source` diz `demo` quando a mensagem veio do botão "Enviar feedback" da demo e `website` quando veio da página principal.

## Proteção contra abuso

- Os emails e as mensagens são validados (formato e tamanho máximo de 2000 caracteres).
- O formulário de feedback tem um campo invisível que os bots preenchem; essas mensagens são descartadas no browser.
- Cada função aceita no máximo 30 envios por minuto, no total.

Se aparecer spam a sério, o passo seguinte é um captcha (por exemplo Cloudflare Turnstile).

## Privacidade

O email da waitlist só serve para avisar do lançamento. O email no feedback é opcional e só serve para responder. Isto está descrito em [`docs/privacy.html`](../docs/privacy.html).
