Em.onLoad 'Ember.Application', (application) ->
  application.initializer
    name: 'ember-auth.module.ember-model'
    before: 'ember-auth-load'

    initialize: (container, app) ->
      app.register 'authModule:emberModel', Em.Auth.EmberModelAuthModule, \
      { singleton: true }
      app.inject 'authModule:emberModel', 'auth', 'auth:main'

  application.initializer
    name: 'ember-auth.module.ember-model-load'
    after: 'ember-auth-load'

    initialize: (container, app) ->
      # force init() call wth an eager-load
      container.lookup 'authModule:emberModel'
