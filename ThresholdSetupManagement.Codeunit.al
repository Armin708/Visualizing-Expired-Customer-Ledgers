codeunit 50110 "Threshold Setup Management"
{
    procedure RunThresholdSetup(var TresholdSetupNotification: Notification)
    var
        ThresholdSetupPage: Page "Threshold Setup";
    begin
        ThresholdSetupPage.Run();
    end;
}
