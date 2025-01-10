tableextension 50111 "Item Jnl Line" extends "Item Journal Line"
{
    internal procedure CheckLine()
    begin
        PerformCheck();
        Message('The line has been checked.');
    end;

    local procedure PerformCheck()
    begin
        if Rec."Item No." = '' then
            Error('Item No. must be filled in.');

        if Rec."Location Code" = '' then
            Error('Location Code must be filled in.');

        if Rec.Quantity = 0 then
            Error('Quantity must be filled in.');
    end;

}