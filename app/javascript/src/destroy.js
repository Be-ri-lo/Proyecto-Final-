function destroy(e) {
  fetch(e.target.href, {
    method: "DELETE",
    headers: {
      Accept: "application/json",
      "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
    },
  })
    .then((data) => data.json())
    .then((place) => {
      const places = document.querySelector("#places tbody");
      const current_post = document.querySelector(`tr[data-id="${place.id}"]`);

      places.removeChild(current_place);
    });
}

export default destroy;
