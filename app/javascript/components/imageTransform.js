const imageTransform = () => {
  const title = document.querySelector('.title-input');
  const imgHeros = document.querySelector('.super-heros-img-one');
  function imgMove(){
    imgHeros.classList.add('img-transform');
  }
  if (title) {
  title.addEventListener('focus', imgMove);
  }
}

export { imageTransform };
