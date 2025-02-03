table 50134 "ItemWithBlob"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Code[20]) { }
        field(2; "Item Name"; Text[100]) { }
        field(3; "Item Image"; BLOB) { Caption = 'Stored Image'; Subtype = Bitmap; }

    }

    keys
    {
        key(PK; "Item No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

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