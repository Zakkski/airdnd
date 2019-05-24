import places from 'places.js';

const initAutocomplete = () => {
  const addressInputEvent = document.getElementById('event_location');
  const addressInputProfile = document.getElementById('profile_address');
  const idArray = [addressInputEvent, addressInputProfile];

  idArray.forEach ((id) => {
    if (id) {
      places({ container: id });
      console.log("initialize Autocomplete")
    }
  })
};

export { initAutocomplete };
