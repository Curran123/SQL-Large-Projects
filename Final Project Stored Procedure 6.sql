USE Libraries

CREATE PROCEDURE getFIVEBOOKS
AS
BEGIN
SELECT borrower.borrower_name, borrower.borrower_address, COUNT (book_loans.card_no) AS Books_Checked_Out
FROM borrower
INNER JOIN book_loans ON book_loans.card_no = borrower.card_no
INNER JOIN book_copies ON book_copies.book_id = book_loans.book_id
GROUP BY borrower.card_no, borrower.borrower_name, borrower.borrower_address
HAVING COUNT (book_loans.card_no) >= 5
;
END

EXEC getFIVEBOOKS

DROP PROC getFIVEBOOKS