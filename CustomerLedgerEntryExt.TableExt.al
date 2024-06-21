tableextension 50110 "Customer Ledger Entry Ext" extends "Cust. Ledger Entry"
{
    fields
    {

    }

    // Add code that calculates the number of days a customer ledger entry is expired by substracting the current date 
    // from the records Due Date. 
    // You only need to calculate if the current date is larger than the Due Date, otherwise you can just return 0.
    local procedure GetNumberOfDaysExpired(): Integer
    begin

        if WorkDate() < "Due Date" then
            exit(0);

        exit(Abs(WorkDate() - "Due Date"));

    end;
}
