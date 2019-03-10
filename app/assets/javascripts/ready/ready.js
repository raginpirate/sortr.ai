console.log("This is working");

function getName() {
  return document.getElementById('name').value;
}

function addItem(id, list) {
  let container = document.createElement('p');
  container.setAttribute("id", id);
  container.setAttribute("style", "text-align: center;");

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

  $("#mainContainer").append(container);
  console.log("test");
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
      name: getName(),
    },
    function(data, status) {
        document.getElementById("myPopup").classList.toggle("show");
      removeItem(id);
      setTimeout(function() {
          document.getElementById("myPopup").classList.remove("show");
          var str = $("#vContainer").text();
          $("#vContainer").text("V-Bucks: " + (Number(str.replace("V-Bucks: ", "").replace("!!!", ""))+1) + "!!!");
      }, 1000);
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

