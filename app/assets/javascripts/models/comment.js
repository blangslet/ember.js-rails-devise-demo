App.Comment = DS.Model.extend({
  post: DS.belongsTo('App.Post'),
  description: DS.attr('string'),
  isActive: DS.attr('boolean'),
  rank: DS.attr('number')
});