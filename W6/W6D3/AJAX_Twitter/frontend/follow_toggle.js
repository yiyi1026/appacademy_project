const APIUtil = require("./api_util");


class FollowToggle {
  constructor(el) { //el === button
    this.$el = $(el); // el is the actual button html code wrapped in jquery
    this.userId = this.$el.data("user-id"); //data attributes
    this.followState = this.$el.data("initial-follow-state");
    this.render(); //PIC OF BUTTON
    // this.handleClick(); //calling button click once button is created
    this.$el.on("click", this.handleClick.bind(this)); // attach click method so it doesn't trigger until clicked
  }

  render(){
    if(this.followState === "unfollowed"){
      this.$el.prop("disabled", false);
      this.$el.html("Follow!");
    }else if (this.followState === "followed"){
      this.$el.prop("disabled", false);
      this.$el.html("Unfollow!");
    } else if (this.followState === "following"){
      this.$el.prop("disabled", true);
      this.$el.html("Following...");
    } else {
      this.$el.prop("disabled", true);
      this.$el.html("Unfollowing...");
    }
  };


  handleClick(event){
    //will trigger callback with the event param

    const followtoggle = this;
    event.preventDefault();

    if (this.followState==="unfollowed") {
      this.followState="following"; //this changes the render property to disable follow button when clicked + loading
      this.render(); //this render disables OR enables click once loaded
      APIUtil.followUser(followtoggle.userId).then(() => {
        followtoggle.followState = "followed";
        followtoggle.render();
      });
    }else if (this.followState === "followed"){
      this.followState="unfollowing";
      this.render();
      APIUtil.unfollowUser(followtoggle.userId).then(() => {
        followtoggle.followState = "unfollowed";
        followtoggle.render();
        //what do we do if error occurs?
      });
    }
  }
}



module.exports = FollowToggle;
