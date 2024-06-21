tableextension 50110 "Customer Ledger Entry Ext" extends "Cust. Ledger Entry"
{
    fields
    {

    }

    // Add code that calculates the number of days a customer ledger entry is expired by substracting the current date 
    // from the records Due Date. 
    // You only need to calculate if the current date is larger than the Due Date, otherwise you can just return 0.
    procedure GetNumberOfDaysExpired(): Integer
    begin

        if Rec."Due Date" = 0D then
            exit(0);


        if Today() < Rec."Due Date" then
            exit(0);

        exit(Abs(Today() - Rec."Due Date"));

    end;
}
