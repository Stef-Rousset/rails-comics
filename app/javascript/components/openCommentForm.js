const openCommentForm = () => {
const newForm = document.querySelector('.new-form');
const status = document.querySelector('.formulaire-new');
  function open(event) {
    status.style.display = 'block';
    event.stopPropagation();
  };
  if(newForm){
  newForm.addEventListener('click', open);
  }
};

export { openCommentForm };


