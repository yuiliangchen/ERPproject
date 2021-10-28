page 50103 "Course List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Course;
    CardPageId = "Course Card";
    Editable = false;
    Caption = 'Course List';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Level; Level)
                {
                    ApplicationArea = All;
                }
                field(Suggestion; Suggestion)
                {
                    ApplicationArea = All;
                }
                field(SPA; SPA)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
            action("Insert Table")
            {
                trigger onAction();
                begin
                    InsertNewRecord();
                end;
            }
        }
    }

    var
        Level: text[30];
        Suggestion: text[80];
        SPA: Boolean;

    procedure InsertNewRecord();
    begin
        Rec.Init();
        Rec.Code := '80040';
        Rec.Name := 'Installation & Configuration';
        Rec.Description := 'Basic Knowledge of Installtion & Configuration';
        Rec.Type := Rec.Type::"Remote Training";
        Rec.Duration := 2.0;
        Rec.Price := 1000.0;
        Rec.Active := true;
        Rec.Difficulty := 5;
        Rec.PassingRate := 75;
        Rec.Insert();
        Rec.Code := '80041';
        Rec.Name := 'Finance';
        Rec.Description := 'Basic knowledge of finance';
        Rec.Type := Rec.Type::"Instructor Led";
        Rec.Duration := 3.0;
        Rec.Price := 1500.0;
        Rec.Active := true;
        Rec.Difficulty := 7;
        Rec.PassingRate := 80;
        Rec.Insert();
        Rec.Code := '80042';
        Rec.Name := 'C/SIDE Introduction';
        Rec.Description := 'Introduction to programming';
        Rec.Type := Rec.Type::"Instructor Led";
        Rec.Duration := 5.0;
        Rec.Price := 2500.0;
        Rec.Active := true;
        Rec.Difficulty := 8;
        Rec.PassingRate := 80;
        Rec.Insert();
        Rec.Code := '80043';
        Rec.Name := 'Introduction';
        Rec.Description := 'Introduction to Microsoft Dynamics NAV';
        Rec.Type := Rec.Type::"Remote Training";
        Rec.Duration := 2.0;
        Rec.Price := 1000.0;
        Rec.Active := true;
        Rec.Difficulty := 4;
        Rec.PassingRate := 60;
        Rec.Insert();
        Rec.Code := '80049';
        Rec.Name := 'Application Setup';
        Rec.Description := 'Basic knowledge of application setup';
        Rec.Type := Rec.Type::"e-Learning";
        Rec.Duration := 2.0;
        Rec.Price := 1000.0;
        Rec.Active := true;
        Rec.Difficulty := 5;
        Rec.PassingRate := 65;
        Rec.Insert();
        Rec.Code := '80050';
        Rec.Name := 'Business Intelligence';
        Rec.Description := 'Basic knowledge of Business Intelligence';
        Rec.Type := Rec.Type::"e-Learning";
        Rec.Duration := 1.0;
        Rec.Price := 500.0;
        Rec.Active := true;
        Rec.Difficulty := 5;
        Rec.PassingRate := 65;
        Rec.Insert();
        Rec.Code := '80055';
        Rec.Name := 'C/SIDE Solution Development';
        Rec.Description := 'Advanced topics in programming';
        Rec.Type := Rec.Type::"Instructor Led";
        Rec.Duration := 5.0;
        Rec.Price := 2500.0;
        Rec.Active := true;
        Rec.Difficulty := 10;
        Rec.PassingRate := 75;
        Rec.Insert();
        Message('Records are inserted');
    end;

    trigger OnAfterGetRecord();
    begin
        Level := '';
        Suggestion := '';
        SPA := false;
        case Rec.Difficulty of
            1 .. 5:
                begin
                    Level := 'Beginner';
                    Suggestion := 'Take e-learning or remote training';
                end;
            6 .. 8:
                begin
                    Level := 'Intermediate';
                    Suggestion := 'Attend intructor-Led';
                end;
            9 .. 10:
                begin
                    Level := 'Advanced';
                    Suggestion := 'Attend instructor-Led and self study'
                end;
        end;
        if (Rec.PassingRate >= 70) AND (Rec.Difficulty >= 6) then
            SPA := true;
    end;
}