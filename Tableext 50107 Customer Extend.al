tableextension 50107 "Customer Extend" extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50100; "Reward ID"; Code[30])
        {
            TableRelation = Reward."Reward ID";
            ValidateTableRelation = true;
            trigger OnValidate()
            begin
                if (Rec."Reward ID" <> xRec."Reward ID") and
                    (Rec.Blocked <> Blocked::" ") then begin
                    Error('Cannot update the reward status of a blocked customer.');
                end;
            end;
        }
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