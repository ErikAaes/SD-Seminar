tableextension 50100 "CSD ResourceExt" extends Resource
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper 
    fields
    {
        modify("Profit %")
        {
            trigger OnAfterValidate()
            begin
                rec.TestField("Unit Cost");
            end;
        }

        modify(Type)
        {
            OptionCaption = 'Instruction,Room';
        }

        field(50101; "CSD Resource Type"; Option)
        {
            Caption = 'Resource Type';
            OptionMembers = "Internal","External";
            OptionCaption = 'Internal,External';
            DataClassification = CustomerContent;
        }

        field(50102; "CSD Maximum Participants"; Integer)
        {
            Caption = 'Maximum Perticipants';
            DataClassification = CustomerContent;
        }
        field(50103; "CSD Quantity Per Day"; Decimal)
        {
            Caption = 'Quantity Per Day';
            DataClassification = CustomerContent;
        }
    }
}