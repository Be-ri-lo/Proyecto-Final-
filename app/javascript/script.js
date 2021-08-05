function createUser(element) {
  return document.createElement(element);
}

function append(parent, element) {
  return parent.appendChild(element);
}

fetch("https://randomuser.me/api/?results=3&inc=gender,name,nat=es")
  .then((resp) => resp.json())
  .then(function (data) {
    let users = data.results;
    return users.map(function (user) {
      let li = createUser("li"),
        img = createUser("img"),
        p = createUser("p");
      img.src = user.picture.large;
      p.innerHTML = `${user.name.first} ${user.name.last}`;
      append(li, img);
      append(li, p);
      append(document.getElementById("users"), li);
    });
  })
  .catch(function (error) {
    console.log(error);
  });
