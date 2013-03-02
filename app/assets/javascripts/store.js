App.Adapter = DS.RESTAdapter.extend()


DS.RESTAdapter.map('App.Post', {
  comments: { embedded: 'load' },
});
DS.RESTAdapter.configure("plurals", { company: "companies" });


App.Store = DS.Store.extend({
  revision: 11,
  adapter:  DS.RESTAdapter.create({
    }),
});