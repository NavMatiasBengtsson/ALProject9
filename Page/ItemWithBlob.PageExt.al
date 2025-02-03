page 50100 ItemWithBlobList
{
    PageType = List;
    SourceTable = ItemWithBlob;
    ApplicationArea = All;

    actions
    {
        area(Processing)
        {
            action(UploadImage)
            {
                Caption = 'Upload Image';
                ApplicationArea = All;
                trigger OnAction()
                var
                    ImgMgt: Codeunit ImageBlobManagment;
                begin
                    ImgMgt.UploadImageToBlob(Rec."Item No.");
                end;
            }

            action(ViewImage)
            {
                Caption = 'View Image';
                ApplicationArea = All;
                trigger OnAction()
                var
                    ImgMgt: Codeunit ImageBlobManagment;
                begin
                    ImgMgt.ViewImageFromBlob(Rec."Item No.");
                end;
            }

            action(DeleteImage)
            {
                Caption = 'Delete Image';
                ApplicationArea = All;
                trigger OnAction()
                var
                    ImgMgt: Codeunit ImageBlobManagment;
                begin
                    ImgMgt.DeleteImageFromBlob(Rec."Item No.");
                end;
            }
        }
    }
}
