const searchBarDisplay = () => {
  const recherche = document.querySelector('.recherche');
  const barre = document.querySelector('.barre');

  function handleSearchBar(event){
   barre.classList.add('anim');
    recherche.addEventListener('click', function(event){
      event.currentTarget.setAttribute('type','submit');
    });
  };
  if (recherche){
  recherche.addEventListener('click', handleSearchBar);
  }
}

export { searchBarDisplay };
