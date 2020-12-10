if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){
  document.addEventListener('DOMContentLoaded', () => {
    const itemImage = document.getElementById('item-image');
    const imageList = document.getElementById('image-list');
    
    const createImage = (blob) => {
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      imageElement.appendChild(blobImage);
      imageList.appendChild(imageElement);

      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('height', '40%');
      blobImage.setAttribute('width', '40%');
    };

    itemImage.addEventListener('change', (e) => {
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImage(blob);
    });
  });
}