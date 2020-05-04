import consumer from "./consumer"

consumer.subscriptions.create("MessagesChannel", {
  connected() {
    console.log('test messages');
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data.content)
    $('#messages').append('<div class="direct-message">' + data.message_sent + ' ' + data.user + ' said: ' + data.content + '</div>')
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
    // Called when there's incoming data on the websocket for this channel
  }
});


var send_message;

$(document).on('turbolinks:load', function() {
  send_message()
})

send_message = function() {
  $('#message_content').on('keydown', function(event) {
    if(event.keyCode === 13) {
      $('input').click()
      event.target.value = ''
      event.preventDefault()
      console.log('message sent');
    }
  })
}
