Em.onLoad 'Ember.Application', (application) ->
  application.initializer
    name: 'ember-auth.module.ember-model'
    before: 'ember-auth-load'

    initialize: (container, app) ->
      app.register 'authModule:emberModel', Em.Auth.EmberModelAuthModule
      app.inject 'authModule:emberModel', 'auth', 'auth:main'
