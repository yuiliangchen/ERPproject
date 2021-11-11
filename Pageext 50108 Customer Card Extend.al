pageextension 50107 "Customer Card Extend" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }
    
    actions
    {
        addlast(processing)
        {
            action(UpdateCreditLimit)
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = CalculateCost;
                ApplicationArea = All;
                Caption = 'Update Credit Limit';
                trigger OnAction()
                begin
                    CallUpdateCreditLimit();
                end;
            }
        }
    }
    
    var
        Text90001: TextConst ENU = 'Are you sure that you want to set the %1 to %2';
        Text90002: TextConst ENU = 'The credit limit was rounded to %1 to comply with company policies.';
        Text90003: TextConst ENU = 'The credit limit is up to date.';
    local procedure CallUpdateCreditLimit()
    var 
        CreditLimitCalculated: Decimal;
        CreditLimitActual: Decimal;
    begin
        CreditLimitCalculated := Rec.CalculateCreditLimit();
        CreditLimitActual := Rec."Credit Limit (LCY)";
        if CreditLimitCalculated =  CreditLimitActual then 
        begin
            Message(Text90003);
            exit;
        end;
        if GuiAllowed and not Confirm(Text90001, false, Rec.FieldCaption("Credit Limit (LCY)"), CreditLimitCalculated) then
        begin
            exit;
        end;
        if CreditLimitActual <> CreditLimitCalculated then
            Message(Text90002, CreditLimitCalculated); 
        CreditLimitActual := CreditLimitCalculated;
        Rec.UpdateCreditLimit(CreditLimitActual);
    end;
}