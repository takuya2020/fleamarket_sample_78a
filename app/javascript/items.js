$(document).on('turbolinks:load', ()=> {

  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js__file__group">
                    <input class="js__file" type="file"
                    name="item[images_attributes][${num}][image_url]"
                    id="item__images__attributes__${num}__src"><br>
                    <div class="js__remove">削除</div>
                  </div>`
  
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" image_url="${url}" width="100px" height="100px">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5];
  lastIndex = $('.js__file__group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden__destroy').hide();

  $('#inputform__body__upload').on('change', '#image__input__btn__file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {
      $('#previews').append(buildImg(targetIndex, blobUrl));
      $('.file_fields').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image__box').on('click', '.js__remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden__destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    if ($('.js__file').length == 0) $('#image__box').append(buildFileField(fileIndex[0]));
  });
});
      
      