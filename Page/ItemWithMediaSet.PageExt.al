page 50101 ItemWithMediaSetList
{
    PageType = List;
    SourceTable = ItemWithMediaSet;
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
                    ImgMgt.UploadImageToMediaSet(Rec."Item No.");
                end;
            }

            action(ViewImages)
            {
                Caption = 'View Images';
                ApplicationArea = All;
                trigger OnAction()
                var
                    ImgMgt: Codeunit ImageBlobManagment;
                begin
                    ImgMgt.ViewImagesFromMediaSet(Rec."Item No.");
                end;
            }

            action(DeleteImages)
            {
                Caption = 'Delete All Images';
                ApplicationArea = All;
                trigger OnAction()
                var
                    ImgMgt: Codeunit ImageBlobManagment;
                begin
                    ImgMgt.DeleteAllImagesFromMediaSet(Rec."Item No.");
                end;
            }
        }
    }
}
