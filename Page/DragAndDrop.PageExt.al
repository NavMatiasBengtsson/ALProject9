page 50102 HappyDragAnddropPage
{
    PageType = Card;
    SourceTable = item;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                FileUploadAction = ProductImageUpload;

                field(name; 'Name')
                {
                    FileUploadAction = ProductImageUpload;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            fileUploadAction(ProductImageUpload)
            {
                Caption = 'Upload product Image';

                AllowMultipleFiles = false;
                AllowedFileExtensions = '.jpg', '.jpeg', '.png';

                trigger OnAction(Files: List of [FileUpload])
                var
                    currentFile: FileUpload;
                    stream: InStream;
                begin
                    foreach currentFile in files do begin
                        currentFile.CreateInStream(stream);
                        // Code here to handle the file
                        Message('%1 has a length of %2', currentFile.FileName, stream.Length);
                    end;
                end;
            }
        }
    }
}