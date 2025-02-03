codeunit 50122 MyCodeunit
{
    local procedure DownloadCustomerPicture(Customer: Record Customer)
    var
        TempBlob: Codeunit "Temp Blob";
        CustomerOutStream: OutStream;
        CustomerInStream: InStream;
        ImageFilter, FileName : Text;
    begin
        TempBlob.CreateOutStream(CustomerOutStream);
        Customer.Image.ExportStream(CustomerOutStream);
        TempBlob.CreateInStream(CustomerInStream);

        ImageFilter := 'Image Files (*.bmp;*.jpg;*.gif)|*.bmp;*.jpg;*.gif';
        FileName := 'Customer Picture';

        if not DownloadFromStream(CustomerInStream, 'Download Customer Picture', '', ImageFilter, FileName) then
            exit;
    end;
}