$(function () {
    $('#bookSearch').submit(function () {
      let $bookInput = $('#bookTitle')
      let searchKeyword = $bookInput.val();
      let $bookList = $('#bookList');
      $bookList.empty();
      $.get('https://www.googleapis.com/books/v1/volumes', { q: searchKeyword, country: 'JP' }).then((books) => {
          books.items.map((book) => {
            let $bookItem = $('<div>');
            $bookItem.append($('<input>', {type: 'radio', name: 'book_id', value: book.id }));
            $bookItem.append(book.volumeInfo.title);
            $bookList.append($bookItem);
            
            let params;
            if (book.volumeInfo.imageLinks) {
              params = {
                google_id: book.id,
                title: book.volumeInfo.title,
                description: book.volumeInfo.description,
                image_url: book.volumeInfo.imageLinks.thumbnail,
              }
            } else {
              params = {
                google_id: book.id,
                title: book.volumeInfo.title,
                description: book.volumeInfo.description,
              }
            }
            $.ajax({
              url: "/books",
              method: "POST",
              headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
              },
              data: params,
              datatype: "json"
            });
          });
      });
      $bookInput.val('');
      return false;
    });
  });