posts = angular.module('posts',['ngResource', 'ui.bootstrap'])

  .factory('post', function($resource) {
    return $resource("posts.json", {}, {
      index:   { method: 'GET', isArray: true, responseType: 'json' },
    });
  })

  .controller('PostListController', function($scope, post) {
    postList = this;
    postList.posts = post.index();
    postList.count = function() {
      return postList.posts.length;
    };
    postList.get_post_id = function(post) {
      return post.url.match(/\/([a-z0-9]+)\.json$/)[1];
    };
  });