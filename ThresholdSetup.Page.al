page 50110 "Threshold Setup"
{
    ApplicationArea = All;
    Caption = 'Threshold Setup';
    PageType = Card;
    SourceTable = "Threshold Setup";
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Threshold 1 Style"; Rec."Threshold 1 Style")
                {
                    ToolTip = 'Specifies the value of the Threshold 1 Style field.', Comment = '%';
                }
                field("Threshold 1 Value"; Rec."Threshold 1 Value")
                {
                    ToolTip = 'Specifies the value of the Threshold 1 Value field.', Comment = '%';
                }
                field("Threshold 2 Style"; Rec."Threshold 2 Style")
                {
                    ToolTip = 'Specifies the value of the Threshold 2 Style field.', Comment = '%';
                }
                field("Threshold 2 Value"; Rec."Threshold 2 Value")
                {
                    ToolTip = 'Specifies the value of the Threshold 2 Value field.', Comment = '%';
                }
            }
        }

    }

    trigger OnOpenPage()

    begin

        if not Rec.Get() then Rec.Insert();

    end;
}
