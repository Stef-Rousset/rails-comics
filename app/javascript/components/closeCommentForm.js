const closeCommentForm = () => {
const formBouton = document.querySelector('.form-bouton');
const status = document.querySelector('.formulaire-new');
  function close() {
    status.style.display = 'none';
  };
  if(formBouton){
  formBouton.addEventListener('click', close);
  }
};

export { closeCommentForm };


