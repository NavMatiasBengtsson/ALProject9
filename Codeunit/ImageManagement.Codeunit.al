codeunit 50110 "Image Management"
{

    procedure ImportItemPicture(Item: Record Item)
    var
        PickInStream: InStream;
        FromFileName: Text;
        OverrideImageQst: Label 'The item already has an image. Do you want to override it?';

    begin
        if Item.Picture.Count() > 0 then
            if not Confirm(OverrideImageQst) then
                exit;

        if File.UploadIntoStream('Import', '', 'All Files (*.*)|*.*',
                                FromFileName, PickInStream) then begin
            Clear(Item.Picture);
            Item.Picture.ImportStream(PickInStream, FromFileName);
            Item.Modify(true);
        end;
    end;
}

