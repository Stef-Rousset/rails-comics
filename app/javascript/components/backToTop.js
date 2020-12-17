const backToTop = () => {
const button = document.querySelector('.top-button');

  if ((window.pageYOffset >= 400) && button){  //pageYoffset renvoit le nb de px dont le document est scrollé
    button.style.visibility = 'visible';
  }
  if (button) {
    button.addEventListener('click', function(){
      window.scrollTo({
      top: 0,
      behavior: 'smooth'
      });
    })
  }
}
export { backToTop };
