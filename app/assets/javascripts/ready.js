console.log("This is working");

function addItem(id, list) {
  let container = document.createElement('p')
  container.setAttribute("id", id);

  let text = document.createTextNode(list);
  container.append(text);

  let div = document.createElement('div');
  let input = document.createElement('input');
  input.setAttribute("type", "text");
  div.append(input);

  let submit = document.createElement('input');
  submit.setAttribute('type', 'submit');
  submit.setAttribute('name', 'commit');
  submit.setAttribute('value', 'submit');
  submit.onclick = function() { submitSorted(id, input); };
  div.append(submit);

  container.append(div);

  document.body.append(container);
}

function removeItem(id) {
  document.getElementById(id).outerHTML = "";
}

function submitSorted(id, input) {
  let sortedList = input.value;
  $.post(
    "/sorted",
    {
      id: id,
      sortedList: sortedList,
      name: "todo",
    },
    function(data, status) {
      removeItem(id);
    }
  );
}
// All the action cable stuff todo
/*
var App = {};

App.cable = ActionCable.createConsumer(`ws://${window.location.hostname}:28080`);

App.messaging = App.cable.subscriptions.create('SomeChannel', {
  received: function(data) {
    $(this).trigger('received', data);
  },
  sendMessage: function(messageBody) {
    this.perform('foobar', { body: messageBody, to: otherPlayerUuid });
  }
});*/
