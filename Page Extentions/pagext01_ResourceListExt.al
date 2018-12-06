pageextension 50102 "CSD ResourceListExt" extends "Resource List"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper 
    layout
    {
        modify(Type)
        {
            Visible = Showtype;
        }
        addafter("Type")
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {

            }
            field("CSD Maximum Participants"; "CSD Maximum Participants")
            {
                Visible = ShowMaxField;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Showtype := (GetFilter(Type) = '');
        ShowMaxField := (GetFilter(Type) = format(Type::Machine));
    end;

    var
        [InDataSet]
        Showtype: Boolean;
        [InDataSet]
        ShowMaxField: Boolean;

}