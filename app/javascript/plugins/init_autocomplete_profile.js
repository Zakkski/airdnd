import places from 'places.js';

const initAutocompleteProfile = () => {
  const addressInput = document.getElementById('profile_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocompleteProfile };
