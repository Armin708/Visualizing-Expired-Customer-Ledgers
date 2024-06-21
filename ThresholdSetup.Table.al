table 50110 "Threshold Setup"
{
    Caption = 'Threshold Setup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Threshold 1 Value"; Integer)
        {
            Caption = 'Threshold 1 Value';
        }
        field(3; "Threshold 2 Value"; Integer)
        {
            Caption = 'Threshold 2 Value';
        }
        field(4; "Threshold 1 Style"; Enum "Style Type")
        {
            Caption = 'Threshold 1 Style';
        }
        field(5; "Threshold 2 Style"; Enum "Style Type")
        {
            Caption = 'Threshold 2 Style';
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
