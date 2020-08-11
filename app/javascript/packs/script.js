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
            
              let params = {
                book: {
                  google_id: book.id,
                  title: book.volumeInfo.title
                }
              }
              $.post('http://localhost:3000/books', params);
          });
      });
      $bookInput.val('');
      return false;
    });
  });