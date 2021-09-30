table 50101 Course
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; Code; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(20; Name; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(40; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Instructor Led","E-Learning","Remote Training"
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}