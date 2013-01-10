locaweb-emailmarketing
======================

APIs for Locaweb Email Marketing
http://www.locaweb.com.br/produtos/email-marketing/planos.html
http://emailmarketing.locaweb.com.br/trial

# How to

client = Client.new auth_token: "apikey", base_url: 'https://emailmarketing.locaweb.com.br'

Accounts:
- list: client.accounts.all
- get: client.acccounts.get("ID")
- update: client.accounts.update("ID", hash_options)
  available options: return_path_domain

##