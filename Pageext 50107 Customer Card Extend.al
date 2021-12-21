pageextension 50107 "Customer Card Extend" extends "Customer Card"
{
    layout
    {
        // The "addlast" contruct adds the field control 
        // as the last control in the group
        addlast(General)
        {
            field("Reward ID"; Rec."Reward ID")
            {
                ApplicationArea = All;
                // Lookup property is used to provide a
                // lookup window for a text box.  It is set 
                // to true, because a look up for the field
                // needed.
                Lookup = true;
            }
        }
    }
    
    actions
    {
        // The "addfirst" construct adds the action as the 
        // first action in the navigation group. 
        addfirst(navigation)
        {
            action("Rewards")
            {
                ApplicationArea = All;
                // "RunObject" sets the "Reward List" page as 
                // the object that will run ehrn the action is
                // activated.
                RunObject = Page "Reward List"; 
            }
        }
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