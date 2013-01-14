locaweb-emailmarketing
======================

APIs for Locaweb Email Marketing
http://www.locaweb.com.br/produtos/email-marketing/planos.html
http://emailmarketing.locaweb.com.br/trial

# How to use

client = Locaweb::Emailmarketing::Client.new auth_token: "Nt5skc1xXsvKKSsyp3Bsx7ABNdJz9pc1uA9kyTdjnJkr", base_url: 'https://emailmarketing.locaweb.com.br/api/v1', account_id: '50f39c8d2234cb782d000001'

Accounts:
- list: client.accounts.all
- get: client.acccounts.get("ID")
- update: client.accounts.update("ID", hash_options)<br />
  available options: return_path_domain

Campaigns:
- list: client.campaigns.all
- get: client.campaigns.get("ID")
- create: client.campaigns.create(options)<br />
  available options: name, description
- update: client.campaigns.update("ID", options)<br />
  available options: name, description
- destroy: client.campaigns.destroy("ID")

Contact Imports:
- list: client.contact_imports.all
- get: client.contact_imports.get("ID")
- create: client.contact_imports.create(options)<br />
  available options: required: [:name, :list_tokens, :url], optional: [:description]

Contacts:
- list: client.contacts.all
- get: client.contacts.get("ID")
- create: client.contacts.create(options)<br />
  available options: required: [], optional: [:custom_fields, :list_tokens]
- update: client.contacts.update("ID", options)<br />
  available options: required: [:email, :list_ids], optional: [:custom_fields]
- destroy: client.contacts.destroy("ID")

Custom Fields:
- list: client.custom_fields.all
- get: client.custom_fields.get("ID")
- create: client.custom_fields.create(options)<br />
  available options: name, type
- update: client.custom_fields.update("ID", options)<br />
  available options: name
- destroy: client.custom_fields.destroy("ID")

Lists:
- list: client.lists.all
- get: client.lists.get("ID")
- create: client.lists.create(options)<br />
  available options: name
- update: client.lists.update("ID", options)<br />
  available options: name
- destroy: client.lists.destroy("ID")