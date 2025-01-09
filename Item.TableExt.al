tableextension 50106 "Item Ext" extends Item
{
    fields
    {
        field(50100; "Custom Category"; Code[20])
        {
            Caption = 'Custom Category';
            DataClassification = ToBeClassified;
        }

        field(50106; "New Description"; Text[100])
        {
            Caption = 'New Description';
        }

    }

}