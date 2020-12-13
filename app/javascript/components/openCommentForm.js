const newForm = document.querySelector('.new-form');
newForm.addEventListener('click', openCommentForm);

  function openCommentForm() {
    const status = document.querySelector('.formulaire-new');
    status.style.display = 'block';
  }

export { openCommentForm };


