table 50100 "CSD Seminar Setup"
{
    DataClassification = CustomerContent;

    Caption = 'Seminar Setup';
    fields
    {
        field(10; "Primary Key"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Primary key';
        }
        field(20; "Seminar Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(30; "Seminar Registration Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Seminar Registration Nos.';
            TableRelation = "No. Series";
        }
        field(40; "Posted Seminar Reg. Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Posted Seminar Reg. Nos.';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}