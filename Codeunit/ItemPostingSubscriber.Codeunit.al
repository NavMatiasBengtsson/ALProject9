codeunit 50120 "Item Posting Subscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnBeforeInsertItemLedgEntry, '', false, false)]

    local procedure OnBeforeInsertItemLedgEntry(var ItemLedgerEntry: Record "Item Ledger Entry")
    var
        Item: Record "Item";
    begin
        if not Item.Get(ItemLedgerEntry."Item No.") then
            exit;

        ItemLedgerEntry."Custom Category" := Item."Custom Category";
    end;
}