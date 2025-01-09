codeunit 50107 "Upgrade Tag Definition"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]

    local procedure OnGetPerCompanyTags(var PerCompanyUpgradeTags: List of [Code[250]])
    begin
        PerCompanyUpgradeTags.Add(GetNewItemFieldUpgradeTag());
    end;

    procedure GetNewItemFieldUpgradeTag(): Text
    begin
        exit('GetNewItemFieldUpgradeTag-20241025');
    end;
}