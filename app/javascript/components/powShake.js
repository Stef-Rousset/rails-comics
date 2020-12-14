const powShake = () => {
  const powImg = document.querySelector('.pow');
  function shakingImg(){
    if (window.pageYOffset >= 450 && powImg) {
    powImg.classList.add('shake');
    }
  }
  window.addEventListener('scroll', shakingImg);
}

export { powShake };


