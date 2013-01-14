locaweb-emailmarketing
======================

APIs for Locaweb Email Marketing
http://www.locaweb.com.br/produtos/email-marketing/planos.html
http://emailmarketing.locaweb.com.br/trial

# How to use

client = Locaweb::Emailmarketing::Client.new auth_token: "TOKEN", base_url: 'https://emailmarketing.locaweb.com.br/api/v1', account_id: 'ID'

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

Campaigns:
- list: client.campaigns.all
- get: client.campaigns.get("ID")
- create: client.campaigns.create(options)
  available options: name, description
- update: client.campaigns.update("ID", options)
  available options: name, description
- destroy: client.campaigns.destroy("ID")

Lists:
- list: client.lists.all
- get: client.lists.get("ID")
- create: client.lists.create(options)
  available options: name
- update: client.lists.update("ID", options)
  available options: name
- destroy: client.lists.destroy("ID")