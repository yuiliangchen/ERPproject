tableextension 50107 "Customer Extend" extends Customer
{
    fields
    {
        // Add changes to table fields here
    }
    
    procedure UpdateCreditLimit(NewCreditLimit: Decimal)
    begin
        Rec.Validate("Credit Limit (LCY)", NewCreditLimit);
        Rec.Modify();
    end;
    procedure CalculateCreditLimit(): Decimal
    var
        Cust: Record Customer;
    begin
        Cust := Rec;
        Cust.SetRange("Date Filter", CalcDate('-12M', WorkDate()), WorkDate());
        Cust.CalcFields("Sales (LCY)");
        exit(Round(Cust."Sales (LCY)"))
    end;
}