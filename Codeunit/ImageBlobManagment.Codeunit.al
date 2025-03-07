codeunit 50134 "ImageBlobManagment"
{
    procedure UploadImageToBlob(ItemNo: Code[20])
    var
        ItemRec: Record "ItemWithBlob";
        InStr: InStream;
        OutStr: OutStream;
        FileName: Text;
        NextItemNo: Code[20];
        LastItemNoInt: Integer;
    begin
        if ItemNo = '' then begin
            // Find last item number and increment
            ItemRec.Reset();
            if ItemRec.FindLast() then begin
                if Evaluate(LastItemNoInt, ItemRec."Item No.") then
                    LastItemNoInt := LastItemNoInt + 1
                else
                    Error('Failed to evaluate item number.');
                NextItemNo := Format(LastItemNoInt);
            end else
                NextItemNo := '1000'; // Start at 1000 if no records exist

            ItemNo := NextItemNo;
            ItemRec.Init();
            ItemRec."Item No." := ItemNo;
            ItemRec.Insert();
        end;

        if UploadIntoStream('Select an Image', '', 'All Files (*.*)|*.*', FileName, InStr) then begin
            if ItemRec.Get(ItemNo) then begin
                ItemRec."Item Image".CreateOutStream(OutStr);
                CopyStream(OutStr, InStr);
                ItemRec.Modify;
                Message('Image uploaded successfully to BLOB.');
            end else
                Error('Item not found.');
        end;
    end;

    procedure ViewImageFromBlob(ItemNo: Code[20])
    var
        ItemRec: Record "ItemWithBlob";
        InStr: InStream;
        FileName: Text;
    begin
        if ItemRec.Get(ItemNo) then begin
            ItemRec."Item Image".CreateInStream(InStr);
            DownloadFromStream(InStr, 'Export Image', 'JPEG Image|*.jpg', 'Image.jpg', FileName);
        end else
            Error('Item not found.');
    end;

    procedure DeleteImageFromBlob(ItemNo: Code[20])
    var
        ItemRec: Record "ItemWithBlob";
    begin
        if ItemRec.Get(ItemNo) then begin
            Clear(ItemRec."Item Image");
            ItemRec.Modify();
            Message('Image deleted successfully from BLOB!');
        end else
            Error('Item not found.');
    end;

    procedure UploadImageToMediaSet(ItemNo: Code[20])
    var
        ItemRec: Record ItemWithMediaSet;
        InStr: InStream;
        FileName: Text;
    begin
        if UploadIntoStream('Select an image', '', 'All Files (*.*)|*.*', FileName, InStr) then begin
            if ItemRec.Get(ItemNo) then begin
                ItemRec."Item Images".ImportStream(InStr, FileName); // ✅ Corrected
                ItemRec.Modify();
                Message('Image added to MediaSet!');
            end else
                Error('Item not found.');
        end;
    end;

    procedure ViewImagesFromMediaSet(ItemNo: Code[20])
    var
        ItemRec: Record ItemWithMediaSet;
    begin
        if ItemRec.Get(ItemNo) then
            if ItemRec."Item Images".Count > 0 then
                Message('Images are stored in MediaSet. Use the built-in Media Viewer to see them.')
            else
                Message('No images found.');
    end;

    procedure DeleteAllImagesFromMediaSet(ItemNo: Code[20])
    var
        ItemRec: Record ItemWithMediaSet;
    begin
        if ItemRec.Get(ItemNo) then begin
            Clear(ItemRec."Item Images");
            ItemRec.Modify();
            Message('All images deleted from MediaSet.');
        end else
            Error('Item not found.');
    end;
}