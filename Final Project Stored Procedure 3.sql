USE Libraries

CREATE PROCEDURE getEMPTYBORROWERS
AS
BEGIN
SELECT borrower.card_no, book_loans.card_no
FROM borrower
FULL OUTER JOIN book_loans ON book_loans.card_no = borrower.card_no
WHERE book_loans.card_no IS NULL 
;
END


EXEC getEMPTYBORROWERS

DROP PROC getEMPTYBORROWERS