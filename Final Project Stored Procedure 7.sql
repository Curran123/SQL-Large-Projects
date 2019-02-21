USE Libraries

CREATE PROCEDURE getSTEPHENKINGCENTRAL
AS
BEGIN
SELECT library_branch.branch_name, book_copies.number_of_copies, book_authors.author_name, books.book_title
FROM library_branch
INNER JOIN book_copies ON book_copies.branch_id = library_branch.branch_id
INNER JOIN books ON books.book_id = book_copies.book_id
INNER JOIN book_authors ON book_authors.book_id = books.book_id
WHERE library_branch.branch_name = 'Central'
GROUP BY library_branch.branch_name, author_name, book_copies.number_of_copies, books.book_title
HAVING book_authors.author_name = 'Stephen King'
;
END

EXEC getSTEPHENKINGCENTRAL