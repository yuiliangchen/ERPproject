page 50104 "My Test Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
//    SourceTable = Course;
    
    layout
    {
        area(Content)
        {
            group(Input)
            {
                field(Value1; Value1)
                {
                    ApplicationArea = All;
                }
                field(Value2; Value2)
                {
                    ApplicationArea = All;
                }
            }
            group(Output)
            {
                field(Result; Result)
                {
                    ApplicationArea = All;
                }

            }
            group(Test)
            {
                field(LoopNo; LoopNo)
                {

                }
                field(YesOrNo; YesOrNo)
                {

                }
                field(Amount; Amount)
                {

                }
                field("When Was It"; "When Was It")
                {

                }
                field("What Time"; "What Time")
                {

                }
                field(Description; Description)
                {

                }
                field("Code Number"; "Code Number")
                {

                }
                field(Ch; Ch)
                {

                }
                field(Color; Color)
                {

                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action("Execute")
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    execute_Result();
                end;
            }
            action("Test Codeunit")
            {
                trigger onACtion()
                begin
                    test_Codeunit();
                end;
            }
        }
    }
    
    var
        myInt: Integer;
        Value1: Integer;
        Value2: Integer;
        Result: Boolean;
        LoopNo: Integer;
        YesOrNo: Boolean;
        Amount: Decimal;
        "When Was It": Date;
        "What Time": Time;
        Description: Text[30];
        "Code Number": Code[10];
        Ch: Char;
        Color: Option Red, Orange, Yelloe, Green, Blue, Violet; 
    
    procedure execute_Result();
    begin
        Result := Value1 > Value2;
    end;
    procedure test_Codeunit();
    var
        myCodeunit: Codeunit 50105;
    begin
//        Codeunit.run(50105);
        myCodeunit.initVariables(LoopNo, YesOrNo, Amount, "When Was It", "What Time", Description, "Code Number", Ch, Color);
        myCodeunit.Run();
    end;
}