import consumer from './consumer'

// $(function() { ... }); で囲むことでレンダリング後に実行される
// レンダリング前に実行されると $('#messages').data('room_id') が取得できない
// turbolinks を使っている場合は $(document).on('turbolinks:load', function() { ... }); で囲う
$(function() {
  const chatChannel = consumer.subscriptions.create({ channel: 'RoomChannel', room: $('#direct_messages').data('room_id') }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      return $('#direct_messages').append(data['direct_message']);
    },

    speak: function(direct_message) {
      return this.perform('speak', {
        direct_message: direct_message
      });
    }
  });

  $(document).on('keypress', function(event) {
    if (event.keyCode === 13) {
      chatChannel.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
});
