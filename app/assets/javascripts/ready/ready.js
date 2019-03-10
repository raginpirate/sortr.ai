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

var App = {};

App.cable = ActionCable.createConsumer(`ws://${window.location.hostname}:3000/cable`);

App.cable.subscriptions.create('DriverNotificationsChannel', {
   connected: function (data) {
      console.log("ur connected and ready to go have fun buddy")
    },
    received: function (data) {
      console.log(data);
      if(data.type == 'create') {
        addItem(data.id, data.list);
      } else if (data.type == 'destroy') {
        removeItem(data.id);
      }
    }
});

