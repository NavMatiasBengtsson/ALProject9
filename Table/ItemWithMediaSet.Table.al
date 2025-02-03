table 50135 "ItemWithMediaSet"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Code[20]) { }
        field(2; "Item Name"; Text[100]) { }
        field(3; "Item Images"; MediaSet) { Caption = 'Product Images'; }
    }

    keys
    {
        key(PK; "Item No.")
        {
            Clustered = true;
        }
    }


    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}