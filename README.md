locaweb-emailmarketing
======================

# Description

API client for [Locaweb Email Marketing](http://www.locaweb.com.br/produtos/email-marketing/planos.html)

Trial account: [http://emailmarketing.locaweb.com.br/trial](http://emailmarketing.locaweb.com.br/trial)

# How to use

## Client
<pre>
    client = Locaweb::Emailmarketing::Client.new auth_token: "Nt5skc1xXsvKKSsyp3Bsx7ABNdJz9pc1uA9kyTdjnJkr",
                                             base_url: 'https://emailmarketing.locaweb.com.br/api/v1',
                                             account_id: '50f8e28abf8d79f935000001'
</pre>
## Accounts:
- list: client.accounts.all
- get: client.acccounts.get("ID")
- update: client.accounts.update("ID", hash_options)<br />
  available options: return_path_domain

## Campaigns:
- list: client.campaigns.all
- get: client.campaigns.get("ID")
- create: client.campaigns.create(options)<br />
  available options: name, description
- update: client.campaigns.update("ID", options)<br />
  available options: name, description
- destroy: client.campaigns.destroy("ID")

## Contact Imports:
- list: client.contact_imports.all
- get: client.contact_imports.get("ID")
- create: client.contact_imports.create(options)<br />
  available options: required: [:name, :list_tokens, :url], optional: [:description]

## Contacts:
- list: client.contacts.all
- get: client.contacts.get("ID")
- create: client.contacts.create(options)<br />
  available options: required: [], optional: [:custom_fields, :list_tokens]
- update: client.contacts.update("ID", options)<br />
  available options: required: [:email, :list_ids], optional: [:custom_fields]
- destroy: client.contacts.destroy("ID")

## Custom Fields:
- list: client.custom_fields.all
- get: client.custom_fields.get("ID")
- create: client.custom_fields.create(options)<br />
  available options: name, type
- update: client.custom_fields.update("ID", options)<br />
  available options: name
- destroy: client.custom_fields.destroy("ID")

## Domains:
- list: client.domains.all
- get: client.domains.get("ID")
- create: client.domains.create(options)<br />
  available options: required: [:name]
- update: client.domains.update("ID", options)<br />
  available options: required: [:name, :default]
- destroy: client.domains.destroy("ID")

## Lists:
- list: client.lists.all
- get: client.lists.get("ID")
- create: client.lists.create(options)<br />
  available options: name
- update: client.lists.update("ID", options)<br />
  available options: name
- destroy: client.lists.destroy("ID")

## Messages:
- list: client.messages.all
- get: client.messages.get("ID")
- create: client.messages.create(options)<br />
  Example:
<pre>
    client.messages.create({
      domain_id: "50f8e28abf8d79f935000002",
      html_body: "lala popo",
      list_ids: ["50f95cbd38a582091f002907"],
      name: "lala",
      sender_name: "name",
      sender: "trial@emailmarketing.locaweb.com.br",
      subject: "teste lala popo",
      scheduled_to: "2013-01-20"
    })
</pre>
- update: client.messages.update("ID", options)<br />
  available options: name
- destroy: client.messages.destroy("ID")