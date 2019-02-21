USE Libraries
 
CREATE PROCEDURE getSHARPSTOWNTRIBES
AS
BEGIN
SELECT book_copies.number_of_copies, library_branch.branch_name, books.book_title
FROM book_copies
INNER JOIN library_branch ON library_branch.branch_id = book_copies.branch_id
INNER JOIN books ON books.book_id = book_copies.book_id
WHERE books.book_title = 'The Lost Tribe'
AND library_branch.branch_name = 'Sharpstown'
;
END

EXEC getSHARPSTOWNTRIBES