codeunit 50110 "Threshold Setup Management"
{
    local procedure RunThresholdSetup(var TresholdSetupNotification: Notification)
    var
        ThresholdSetupPage: Page "Threshold Setup";
    begin
        ThresholdSetupPage.Run();
    end;
}
