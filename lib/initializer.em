Em.onLoad 'Ember.Application', (application) ->
  application.initializer
    name: 'ember-auth-module-ember-model'
    after: 'ember-auth'

    initialize: (container, app) ->
      app.register 'authModule:emberModel', Em.Auth.EmberModelAuthModule
