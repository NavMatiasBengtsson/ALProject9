tableextension 50120 "Item Ledger Entry Ext" extends "Item Ledger Entry"
{
    fields
    {
        field(50130; "Custom Category"; Code[20])
        {
            Caption = 'Custom Category';
            DataClassification = ToBeClassified;
        }

    }

}