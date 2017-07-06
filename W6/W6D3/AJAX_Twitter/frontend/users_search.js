class UsersSearch {
  constructor(el) { //el === nav
    this.$el = $(el),
    this.$input = this.$el.find("input[name=username]"),
    this.$ul = this.$el.find("")
  }
}


//handling success
// empty list ul
// iterate user that match letter,
// each user, make LI, which contains a tag
// append it to UL


//adding follow toggle
// a button to follow & unfollow users
