class Em.Auth.EmberModelAuthModule
  init: ->
    @auth._config 'emberModel', @_defaultConfig
    @config? || (@config = @auth._config 'emberModel')
    @patch()

    @auth.reopen
      user: Em.computed.alias 'module.emberModel.user'

    @auth.addHandler 'signInSuccess',  @findUser.bind(@)
    @auth.addHandler 'signInError',    @clearUser.bind(@)
    @auth.addHandler 'signOutSuccess', @clearUser.bind(@)

  _defaultConfig:
    # [string|false] enable auto-loading user model by setting this to a
    #   *string* of the model type, as in 'App.User', not App.User
    #   or false to disable auto-loading user model
    userModel: false

  # @property [Ember.Model|null] current signed in user, if signed in and
  #   enabled auto-find user; otherwise null
  user: null

  # find the current signed in user
  findUser: ->
    return unless @auth.userId? && (model = Em.get @config.userModel)
    model.fetch(@auth.userId).then (user) => @user = user

  # clear any current signed in user
  clearUser: ->
    @user = null

  patch: ->
    self = this
    Ember.RESTAdapter.reopen
      _ajax: (url, params, method, settings) ->
        super url, params, method, self.auth._strategy.serialize(settings || {})
