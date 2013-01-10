locaweb-emailmarketing
======================

APIs for Locaweb Email Marketing
http://www.locaweb.com.br/produtos/email-marketing/planos.html
http://emailmarketing.locaweb.com.br/trial

# How to use

client = Client.new auth_token: "apikey", base_url: 'https://emailmarketing.locaweb.com.br'

Accounts:
- list: client.accounts.all
- get: client.acccounts.get("ID")
- update: client.accounts.update("ID", hash_options)
  available options: return_path_domain

Custom Fields:
- list: client.custom_fields.all
- get: client.custom_fields.get("ID")
- create: client.custom_fields.create(options)
  available options: name, type
- update: client.custom_fields.update("ID", options)
  available options: name
- destroy: client.custom_fields.destroy("ID")
