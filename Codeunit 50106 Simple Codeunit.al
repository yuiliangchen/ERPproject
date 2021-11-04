codeunit 50106 "Simple Codeunit"
{
    trigger OnRun()
    begin
        Message('First Name: %1 - Last Name: %2', FirstName, LastName);        
    end;
    
    var
        name: Text[30];
        FirstName: Text[30];
        LastName: Text[30];
    procedure setName(newName: Text[30]);
    begin
        name := newName;
    end;
    procedure setFirstName(newName: Text[30]);
    begin
        FirstName := newName;
    end;
    procedure setLastName(newName: Text[30]);
    begin
        LastName := newName;
    end;
    procedure getName(): Text[30];
    begin
        exit(name);
    end;
}
codeunit 50107 "Simple Assignment"
{
    trigger OnRun()
    begin
        cu1.setName('Jim');
        cu2.setName('Smith');
        Message('First Name: %1 - Last Name: %2', cu1.getName(), cu2.getName());
    end;
    
    var
        cu1: Codeunit 50106;
        cu2: Codeunit 50106;
}