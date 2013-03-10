App.CustomRESTSerializer = DS.RESTSerializer.extend({
  extractMeta: function(loader, type, json) {
    var meta;
    meta = json[this.configOption(type, 'meta')];
    if (!meta) { return; }
    Ember.set('App.metaData', meta);
    this._super(loader, type, json);
  }
});


App.Adapter = DS.RESTAdapter.extend()


DS.RESTAdapter.map('App.Post', {
  comments: { embedded: 'load' },
});
DS.RESTAdapter.configure("plurals", { company: "companies" });


App.Store = DS.Store.extend({
  revision: 11,
  adapter:  DS.RESTAdapter.create({
  	bulkCommit: false,
    serializer: App.CustomRESTSerializer
    }),
});

App.ready = function() {
  App.CompanyMembership.find();
}