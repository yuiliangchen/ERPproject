page 50121 "Reward Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = Reward;

    layout
    {
        area(Content)
        {
            group(Reward)
            {
                field("Reward ID"; Rec."Reward ID")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Discoiunt Percentage"; Rec."Discount Percentage")
                {
                    ApplicationArea = All;
                }
                /*                field ("Minimum Purchase"; Rec."Minimum Purchase")
                                {
                                    ApplicationArea = All;
                                }
                                field ("Last Modified Date"; Rec."Last Modified Date")
                                {
                                    ApplicationArea = All;
                                }
                */
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}