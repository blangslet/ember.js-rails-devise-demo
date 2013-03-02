App.Router.map(function() {
  this.resource("posts", { path: "/" }, function() {
    this.resource('post', { path: ':post_id' }, function() {
        this.route('active');
        this.route('inactive');
     });
   });
});