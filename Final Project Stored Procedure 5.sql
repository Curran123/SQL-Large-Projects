USE Libraries

CREATE PROCEDURE getBRANCHLOANS
AS
BEGIN
SELECT library_branch.branch_name, COUNT (book_loans.branch_id) AS LOANED
FROM book_loans
INNER JOIN library_branch ON library_branch.branch_id = book_loans.branch_id
GROUP BY library_branch.branch_name
;
END

EXEC getBRANCHLOANS

