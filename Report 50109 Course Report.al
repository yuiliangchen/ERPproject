report 50109 "Course Report"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    RDLCLayout = 'Course Report.rdl';

    dataset
    {
        dataitem(Course; Course)
        {
            column(Code; Course.Code)
            {

            }
            column(Name; Course.Name)
            {

            }
            column(Description; Course.Description)
            {

            }
            column(Type; Course.Type)
            {

            }
            column(Duration; Course.Duration)
            {

            }
            column(Price; Course.Price)
            {

            }
            column(Active; Course.Active)
            {

            }
            column(Difficulty; Course.Difficulty)
            {

            }
            column(PassingRate; Course.PassingRate)
            {

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    //                field(Name; SourceExpression)
                    //                {
                    //                    ApplicationArea = All;
                    //                    
                    //                }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
}