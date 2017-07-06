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
    const favoriteInput = document.querySelector('.favorite-input');
    const favorite = favoriteInput.value;
    favoriteInput.value = '';
    // --- your code here!
    const newListLi = document.createElement('li');
    newListLi.textContent = favorite;

    const favoritesList = document.getElementById("sf-places");
    favoritesList.appendChild(newListLi);

  };
    const placeSubmitButton = document.querySelector('.favorite-submit');
    placeSubmitButton.addEventListener("click", handleFavoriteSubmit);


  // adding new photos
  const showPhotoForm = (e) => {
   const photoFormDiv = document.querySelector(".photo-form-container");
   //show or hide the form;
   if (photoFormDiv.className === "photo-form-container") {
     photoFormDiv.className = "photo-form-container hidden";
   } else {
     photoFormDiv.className = "photo-form-container";
   }
 };

 const photoFormShowButton = document.querySelector(".photo-show-button");
 photoFormShowButton.addEventListener("click", showPhotoForm);
  // --- your code here!
  const handleNewPhotoSubmit=(e)=>{
    e.preventDefault();

    const newPhotoinputEl = document.querySelector('.photo-url-input');
    const newPhotoEl = newPhotoinputEl.value;
    newPhotoinputEl.value = '';

    const newImg = document.createElement('img');
    newImg.src = newPhotoEl;

    const dogphotoli = document.createElement('li');
    dogphotoli.appendChild(newImg);

    const dogphotosul = document.querySelector(".dog-photos");
    dogphotosul.appendChild(dogphotoli);

  }
  const photoSubmitButton = document.querySelector('.photo-url-submit');
  photoSubmitButton.addEventListener("click", handleNewPhotoSubmit);




});
