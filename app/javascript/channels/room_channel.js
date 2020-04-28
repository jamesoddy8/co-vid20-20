import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data.content)
    $('#chatbox').append('<div class="message">' + data.time_commented + ' ' + data.commentor + ' said: ' + data.content + '</div>')
    $('#chatbox').scrollTop($('#chatbox')[0].scrollHeight);
    // Called when there's incoming data on the websocket for this channel
  }
});

var submit_comment;

$(document).on('turbolinks:load', function() {
  submit_comment()
})

submit_comment = function() {
  $('#comment_content').on('keydown', function(event) {
    if(event.keyCode === 13) {
      $('input').click()
      event.target.value = ''
      event.preventDefault()
      console.log('comment inserted.');
    }
  })
}
