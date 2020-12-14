if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){
  document.addEventListener('DOMContentLoaded', () => {
    const selectImage = document.getElementById('item-images');
    
    //画像が選択された時に発火
    selectImage.addEventListener('change', (e) => {
      
      //プレビューを表示させる場所を取得
      const placePreview = document.getElementById('preview-area');
      
      //選択された画像の情報を取得
      const files = e.target.files;
      
      for (let i = 0; i < files.length; i += 1){

        //画像1つずつにURLを与える
        const file = files[i]
        const blob = window.URL.createObjectURL(file);

        //画像を表示するための要素を生成
        const previewDiv = document.createElement('div');
        const previewImg = document.createElement('img');

        //画像URLをimg要素にセット
        previewImg.setAttribute('src', blob);

        //画像の詳細を指定
        previewImg.setAttribute('id', `item-image-${i+1}`)
        previewDiv.setAttribute('class', 'preview-images')
        previewImg.setAttribute('height', '100%')
        previewImg.setAttribute('width', '100%')

        //要素を表示させる
        previewDiv.appendChild(previewImg);
        placePreview.appendChild(previewDiv);

      }
    });
  });
}