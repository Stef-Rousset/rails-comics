const backToTop = () => {
const topButton = document.querySelector('.top-button');
  function addButton(){
    if (window.pageYOffset >= 400 && topButton) {  //pageYoffset renvoit le nb de px dont le document est scrollé
      topButton.style.visibility = 'visible';
      };
    }
  window.addEventListener('scroll', addButton);

  if (topButton){
    topButton.addEventListener('click', function(){
          window.scrollTo({
          top: 0,
          behavior: 'smooth'
          });
    });
  };
}
export { backToTop };
