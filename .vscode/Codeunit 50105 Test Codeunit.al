codeunit 50105 "Test Codeunit"
{
    trigger OnRun()
    begin
        Message ('The value of %1 is %2', 'LoopNo', LoopNo);
        Message ('The value of %1 is %2', 'YesOrNo', YesOrNo);
        Message ('The value of %1 is %2', 'Amount', Amount);
        Message ('The value of %1 is %2', 'When Was It', "When Was It");
        Message ('The value of %1 is %2', 'What Time',  "What Time");
        Message ('The value of %1 is %2', 'Description', Description);
        Message ('The value of %1 is %2', 'Code Number', "Code Number");
        Message ('The value of %1 is %2', 'Ch', Ch);
        Message ('The value of %1 is %2', 'Color', Color);
    end;
    
    var
        LoopNo: Integer;
        YesOrNo: Boolean;
        Amount: Decimal;
        "When Was It": Date;
        "What Time": Time;
        Description: Text[30];
        "Code Number": Code[10];
        Ch: Char;
        Color: Option Red, Orange, Yelloe, Green, Blue, Violet; 
    procedure initVariables(l: Integer; y: Boolean; a: Decimal; when: Date; what: Time; d: Text[30]; co: Code[10]; c: Char; col: Option)
    begin
        LoopNo:= l;
        YesOrNo:= y;
        Amount:= a;
        "When Was It":= when;
        "What Time":= what;
        Description:= d;
        "Code Number":= co;
        Ch:= c;
        Color:= col; 

    end;
}