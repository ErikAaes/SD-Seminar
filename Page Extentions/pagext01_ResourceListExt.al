pageextension 50102 "CSD ResourceListExt" extends "Resource List"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper 
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }


    trigger OnOpenPage()
    begin
        showtype := (GetFilter(Type) = '');
        ShowMaxField := (GetFilter(Type) = format(Type::Machine));
    end;

    var
        [InDataSet]
        showtype: Boolean;
        ShowMaxField: Boolean;

}