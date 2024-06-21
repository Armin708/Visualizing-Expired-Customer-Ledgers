pageextension 50110 "Customer Ledger Entries Ext" extends "Customer Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field(NumberOfDaysExpired; NumberOfDaysExpired)
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Number of Days Expired';
                ToolTip = 'The number of days this entry is expired, based upon Due Date and today.';
                StyleExpr = DaysExpiredStyle;
            }
        }

    }

    views
    {
        addfirst
        {
            view("Open Entries")
            {
                Caption = 'Open Entries';
                OrderBy = ascending("Due Date");
                Filters = where(Open = const(true));
                SharedLayout = false;
                layout
                {
                    movefirst(Control1; NumberOfDaysExpired)
                    moveafter(NumberOfDaysExpired; "Due date")
                }
            }
        }
    }

    var
        ThresholdSetup: Record "Threshold Setup";
        NumberOfDaysExpired: Integer;
        DaysExpiredStyle: Text;

    trigger OnOpenPage()
    begin
        clear(ThresholdSetup);
        if not ThresholdSetup.Get('') then begin

            ShowThresholdSetupNotification();
            CurrPage.Update();

        end;

    end;

    trigger OnAfterGetRecord()
    begin

        NumberOfDaysExpired := Rec.GetNumberOfDaysExpired();

        case NumberOfDaysExpired of
            ThresholdSetup."Threshold 1 Value" .. ThresholdSetup."Threshold 2 Value":
                DaysExpiredStyle := format(ThresholdSetup."Threshold 1 Style");
            ThresholdSetup."Threshold 2 Value" .. 99999:
                DaysExpiredStyle := format(ThresholdSetup."Threshold 2 Style");
            else
                DaysExpiredStyle := 'None';
        end;

    end;

    local procedure ShowThresholdSetupNotification()
    var
        ThresholdSetupNotification: Notification;
        ThresholdSetupNotificationMsg: Label 'You need to run the Threshold Setup:';
        ThresholdSetupNotificationActionMsg: Label 'Click here to run the ThresholdSetup';
    begin

        ThresholdSetupNotification.Message(ThresholdSetupNotificationMsg);
        ThresholdSetupNotification.AddAction(ThresholdSetupNotificationActionMsg, Codeunit::"Threshold Setup Management", 'RunThresholdSetup');
        ThresholdSetupNotification.Send();
    end;

}
