codeunit 50106 "My Upgrade"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    begin
        CopyNewItemField();
    end;

    local procedure CopyNewItemField()
    var
        Item: Record Item;
        UpgradeTagMgt: Codeunit "Upgrade Tag";
        UpgradeTagDefinition: Codeunit "Upgrade Tag Definition";
        DT: DataTransfer;
    begin
        if UpgradeTagMgt.HasUpgradeTag(UpgradeTagDefinition.GetNewItemFieldUpgradeTag()) then
            exit;

        DT.SetTables(Database::Item, Database::Item);
        DT.AddSourceFilter(Item.FieldNo(Blocked), '=%1', false);
        DT.AddFieldValue(Item.FieldNo(Description), Item.FieldNo("New Description"));
        DT.CopyFields();


        UpgradeTagMgt.SetUpgradeTag(UpgradeTagDefinition.GetNewItemFieldUpgradeTag());
    end;
}