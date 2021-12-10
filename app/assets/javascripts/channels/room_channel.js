console.log("RoomChannel.js");

App.cable.subscriptions.create('RoomChannel', {
  connected() {
    console.log("connected")
  },
  received: function(data) {
    console.log("Recieved");
    const messageContainer = document.getElementById('messages')
    messageContainer.innerHTML = messageContainer.innerHTML + "<div class='message mb-2'><div class='content-container'><div class='content'>" + data.content + "</div><div class='author'>" + data.email + "</div></div></div>";
    document.getElementById("new_message").reset();
    document.getElementById("message-id").disabled = false;
  },

  disconnected() {
      document.getElementById("new_message").reset();
      document.getElementById("message-id").disabled = false;
  },
});