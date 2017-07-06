document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });


  const handleFavoriteSubmit=(e)=>{
    e.preventDefault();
  // adding SF places as list items
    const sfPlaceInputEl = document.querySelector('.favorite-input');
    const sfPlace = sfPlaceInputEl.value;
    sfPlaceInputEl.value = '';
    // --- your code here!
    const ul = document.getElementByID("sf-places");
    const li = document.createElement('li');
    li.textContent = sfPlace;
    ul.appendChild(li);

    const placeSubmitButton = document.querySelector('.favorite-submit');
    placeSubmitButton.addEventListener("click", handleFavoriteSubmit);


  // adding new photos

  // --- your code here!

  }

});
