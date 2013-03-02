App.PostController = Ember.ObjectController.extend({
	comments: (function() {
        return Ember.ArrayProxy.createWithMixins(Ember.SortableMixin, {
          sortProperties: ['rank'],
          content: this.get('filteredComments')
        })
      }).property('filteredComments'),

	addComment: function(value) {
    var post = this.controllerFor('post').get('model');
        comments = post.get('comments');

    comments.createRecord({
      description: "New elite high ranked comment",
      isActive: true,
      rank: 1
    });
    this.get('store').commit();

  }
    
});