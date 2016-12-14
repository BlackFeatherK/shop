
function subscribe_room( room_id ) {

  App.messages = App.cable.subscriptions.create(
    {
      channel: "MessagesChannel",
      room_id: room_id
    },
    {
      connected: function() {
        console.log("connected to MessagesChannel")
      },
      disconnected: function() {},
      received: function(data) {

        $("#messages").prepend(data);

        //$("#messages").prepend(
        //  "<li>" + data["content"] +
        //    " at " + data["created_at"] +
        //   "</li>"
        //)

      },
      speak: function(content){
        this.perform("speak", { content: content })
      }
    }
  );

}