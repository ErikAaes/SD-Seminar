pageextension 50100 "CSD ResourceCardExt" extends "Resource Card"
{
    // CSD1.00 - 2018-02-01 - D. E. Veloper 
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {

            }

            field("CSD Quantity Per Day"; "CSD Quantity Per Day")
            {

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}