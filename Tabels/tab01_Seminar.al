table 50101 "CSD Seminar"
{
    DataClassification = CustomerContent;
    Caption = 'Seminar';

    fields
    {
        field(10; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.Get();
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20; "Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
        }
        field(30; "Seminar Duration"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Seminar Duration';
            DecimalPlaces = 0 : 1;
        }
        field(40; "Minimum Participants"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Minimum Participants';
        }
        field(50; "Maximum Participants"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Maximum Participants';
        }
        field(60; "Search Name"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Search Name';
        }
        field(70; "Blocked"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Blocked';
            Editable = false;
        }
        field(80; "Last Modified Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Last Modified Date';
        }
        field(90; "Comment"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Comment';
            Editable = false;
            //FieldClass = FlowField;
            //CalcFormula=exist("Seminar Comment Line") where("Table Name" = const("Seminar"),"No."=Field("No."));
        }
        field(100; "Seminar Price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Seminar Price';
            AutoFormatType = 1;
        }
        field(110; "Gen. Prod. Posting Group"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(120; "VAT Prod. Posting Group"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(130; "No. Series"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "No. Series")
        {
            Clustered = true;
        }
        key(SK; "Search Name")
        {
            Clustered = false;
        }

    }

    var
        SeminarSetup: Record "CSD Seminar Setup";
        //CommentLine : Record"CSD Seminar Comment Line";
        Seminar: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            SeminarSetup.Get();
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin
        "Last Modified Date" := Today();
    end;

    trigger OnRename()
    begin
        "Last Modified Date" := Today();
    end;

    trigger OnDelete()
    begin
        //CommentLine.Reset;
        //CommentLine.Setrange("Table Name",CommentLine."Table Name"::Seminar);
        //CommentLine.SetRange("No.","No.");
        //CommentLine.DeleteAll;        
    end;
}