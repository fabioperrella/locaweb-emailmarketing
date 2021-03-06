locaweb-emailmarketing
======================

# Description

API client for [Locaweb Email Marketing](http://www.locaweb.com.br/produtos/email-marketing/planos.html)

Trial account: [http://emailmarketing.locaweb.com.br/trial](http://emailmarketing.locaweb.com.br/trial)

# How to use

## Client
<pre>
client = Locaweb::Emailmarketing::Client.new auth_token: "TOKEN",
                                             base_url: 'https://emailmarketing.locaweb.com.br/api/v1',
                                             account_id: 'ID'
</pre>
## Accounts
- list: client.accounts.all
- get: client.acccounts.get("ID")
- update: client.accounts.update("ID", hash_options)<br />
  available options: return_path_domain

## Campaigns
- list: client.campaigns.all
- get: client.campaigns.get("ID")
- create: client.campaigns.create(options)<br />
  available options: name, description
- update: client.campaigns.update("ID", options)<br />
  available options: name, description
- destroy: client.campaigns.destroy("ID")

## Contact Imports
- list: client.contact_imports.all
- get: client.contact_imports.get("ID")
- create: client.contact_imports.create(options)<br />
  available options: required: [:name, :list_tokens, :url], optional: [:description]

## Contacts
- list: client.contacts.all
- get: client.contacts.get("ID")
- create: client.contacts.create(options)<br />
  available options: required: [], optional: [:custom_fields, :list_tokens]
- update: client.contacts.update("ID", options)<br />
  available options: required: [:email, :list_ids], optional: [:custom_fields]
- destroy: client.contacts.destroy("ID")

## Custom Fields
- list: client.custom_fields.all
- get: client.custom_fields.get("ID")
- create: client.custom_fields.create(options)<br />
  available options: name, type
- update: client.custom_fields.update("ID", options)<br />
  available options: name
- destroy: client.custom_fields.destroy("ID")

## Domains
- list: client.domains.all
- get: client.domains.get("ID")
- create: client.domains.create(options)<br />
  available options: required: [:name]
- update: client.domains.update("ID", options)<br />
  available options: required: [:name, :default]
- destroy: client.domains.destroy("ID")

## Lists
- list: client.lists.all
- get: client.lists.get("ID")
- create: client.lists.create(options)<br />
  available options: name
- update: client.lists.update("ID", options)<br />
  available options: name
- destroy: client.lists.destroy("ID")

## Messages
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
  Example:
<pre>
    client.messages.update("ID", {subject: "lalapopo2"})
</pre>
- destroy: client.messages.destroy("ID")

More info: [http://wiki.locaweb.com.br/pt-br/APIs_Novo_Email_Marketing/Gerenciar_Mensagens](http://wiki.locaweb.com.br/pt-br/APIs_Novo_Email_Marketing/Gerenciar_Mensagens)

## Reports
- overview: client.messages.overview("ID")
- openings: client.messages.openings("ID")
- uniq_openings: client.messages.uniq_openings("ID")
- links: client.messages.links("ID")
- clicks: client.messages.clicks("ID")
- bounces: client.messages.bounces("ID")

More info: [http://wiki.locaweb.com.br/pt-br/APIs_Novo_Email_Marketing/Gerenciar_Relatorios](http://wiki.locaweb.com.br/pt-br/APIs_Novo_Email_Marketing/Gerenciar_Relatorios)

## Senders
- list: client.senders.all
- get: client.senders.get("ID")
- create: client.senders.create(options)<br />
  available options: email
- destroy: client.senders.destroy("ID")

## Unsubscribe Reasons
- list: client.unsubscribe_reasons.all
- get: client.unsubscribe_reasons.get("ID")
- create: client.unsubscribe_reasons.create(options)<br />
  available options: name
- update: client.unsubscribe_reasons.update("ID", options)<br />
  available options: name
- destroy: client.unsubscribe_reasons.destroy("ID")

## Other

### Pagination
To return a specif page, pass param to method <i>all</i> like this:
<pre>
  client.contacts.all(4)
</pre>