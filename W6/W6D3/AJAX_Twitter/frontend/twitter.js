const FollowToggle = require('./follow_toggle.js');

$(function() {
   $("button.follow-toggle").each( (index, element) => new FollowToggle(element) );
});
