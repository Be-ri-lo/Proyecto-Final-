function place_create(e) {
  const place = {
    place: {
      country: e.target[1].value,
      city: e.target[2].value,
      location: e.target[3].value,
      latitude: e.target[4].value,
      longitude: e.target[5].value,
    },
  };

  console.log(place);

  fetch(e.target.action, {
    method: e.target.method,
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
      "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
    },
    body: JSON.stringify(place),
  })
    .then((data) => data.json())
    .then((place) => {
      const tr = document.createElement("tr");
      tr.dataset.id = place.id;
      const html = `
    <td>${place.country}</td>
    <td>${place.city}</td>
    <td>${place.location}</td>
    <td>${place.latitude}</td>
    <td>${place.longitude}</td>
    <td><a href="/places/${place.id}">Show</a></td>
    <td><a href="/places/${place.id}/edit">Edit</a></td>
    <td><a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/places/${place.id}">Destroy</a></td>
  `;

      tr.innerHTML = html;
      document.querySelector("#places").appendChild(tr);
    });
}

export default place_create;
