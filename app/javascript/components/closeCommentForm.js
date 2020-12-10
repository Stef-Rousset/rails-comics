const formBouton = document.querySelector('.form-bouton');
document.querySelector('.formBouton').onclick = closeCommentForm();

function closeCommentForm() {
  const status = document.querySelector('.formulaire-new');
  status.style.display = 'none';
}

export { closeCommentForm };
