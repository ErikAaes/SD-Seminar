page 50100 "CSD Seminar Setup"
{
    PageType = Card;
    Caption = 'Seminar Setup';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Setup";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                field("Seminar Nos."; "Seminar Nos.")
                {
                    ApplicationArea = All;

                }
                field("Seminar Registration Nos.";
                "Seminar Registration Nos.")
                {

                }
                field("Posted Seminar Reg. Nos.";
                "Posted Seminar Reg. Nos.")
                {

                }
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
    trigger OnOpenPage()
    begin
        if not get then begin
            init;
            insert;
        end;
    end;

    var
        myInt: Integer;
}
