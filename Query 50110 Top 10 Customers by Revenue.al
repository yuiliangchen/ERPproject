query 50110 "Top 10 Customers by Revenue"
{
    QueryType = Normal;
    OrderBy = descending(Amount__LCY_);
    TopNumberOfRows = 10;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.")
            {

            }
            column(Name; "Name")
            {

            }
            column(Customer_Posting_Group; "Customer Posting Group")
            {

            }
            dataitem(Cust_Ledger_Entry; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;
                DataItemTableFilter = "Document Type" = filter(Invoice | "Credit Memo");
                column(Amount__LCY_; "Amount (LCY)")
                {
                    Method = Sum;
                }
            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}
codeunit 50110 "Reset Top 10 Cust. Cred. Limit"
{
    trigger OnRun()
    begin
        Top10Cust.SetFilter(Amount__LCY_, '>%1', 0);
        Top10Cust.Open();
        while Top10Cust.Read() do begin
            Cust.get(Top10Cust.No_);
            CustTmp := Cust;
            CustTmp.Insert();
        end;
        Top10Cust.Close();
        if Page.RunModal(Page::"Customer List", CustTmp) = Action::LookupOK then
            ConfirmReset();
    end;
    local procedure ResetCreditLimit();
    begin
        if CustTmp.FindSet() then
            repeat
                Cust.get(CustTmp."No.");
                Cust."Credit Limit (LCY)" := 0;
                Cust.Modify();
            until CustTmp.Next() = 0;
        Message(Text002);
    end;
    local procedure ConfirmReset();
    begin
        if Confirm(Text001, false, Cust.FieldCaption("Credit limit (LCY)"), 0) then
            ResetCreditLimit();
    end;
    var
        myInt: Integer;
        Top10Cust: Query 50110;
        Cust: Record Customer;
        CustTmp: Record Customer temporary;
        Text001: Label 'Do you wnat to reset %1 to %2 for these customers?';
        Text002: Label 'Action completed successfully';
}