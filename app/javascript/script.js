document.addEventListener(
  "DOMContentLoaded",
  function () {
    const cardDeck = document.querySelector("#get_api.card-deck");
    if (!cardDeck) return 0;

    fetch("https://randomuser.me/api/?results=50")
      .then((response) => response.json())
      .then(function (data) {
        const users = data.results.map(function (user) {
          const node = document.createElement("div");
          node.className = "card";
          node.innerHTML = `
          <div class="card-body">
              <h5 class="card-title">${user.name.first}</h5>
              <p class="card-text">${user.email}</p>
          </div>`;

          return node;
        });

        users.forEach((user) => cardDeck.appendChild(user));
      })
      .catch((error) => console.error(error));
  },
  false
);
