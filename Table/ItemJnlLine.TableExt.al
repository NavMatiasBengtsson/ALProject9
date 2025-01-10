tableextension 50111 "Item Jnl Line" extends "Item Journal Line"
{
    internal procedure CheckLine()
    var
        ErrorMessageManagement: Codeunit "Error Message Management";
        ErrorMessageHandler: Codeunit "Error Message Handler";
    begin
        ErrorMessageManagement.Activate(ErrorMessageHandler);

        PerformCheck();

        if ErrorMessageHandler.HasErrors() then
            ErrorMessageHandler.ShowErrors()
        else
            Message('The line has been checked and is ok.');
    end;

    local procedure PerformCheck()
    var
        ErrorMessageManagement: Codeunit "Error Message Management";
    begin
        if Rec."Item No." = '' then
            ErrorMessageManagement.LogSimpleErrorMessage('Item No. must be filled in.');

        if Rec."Location Code" = '' then
            ErrorMessageManagement.LogSimpleErrorMessage('Location Code must be filled in.');

        if Rec.Quantity = 0 then
            ErrorMessageManagement.LogError(Rec, 'Quantity must be filled in.', 'BLOCKED CUSTOMER');
    end;

}