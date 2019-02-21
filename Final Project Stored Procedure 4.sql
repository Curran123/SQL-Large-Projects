USE Libraries

CREATE PROCEDURE getSHARPSTOWNDUEDATE
AS
BEGIN
SELECT book_loans.date_due, borrower.borrower_name, borrower.borrower_address, borrower.borrower_phone
FROM book_loans
INNER JOIN borrower ON borrower.card_no = book_loans.card_no
WHERE book_loans.date_due = '2019-02-20'
;
END

EXEC getSHARPSTOWNDUEDATE