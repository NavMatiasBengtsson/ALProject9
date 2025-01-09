codeunit 50121 "Item Subrcriber"
{
    [EventSubscriber(ObjectType::Table, Database::Item, OnBeforeValidateBaseUnitOfMeasure, '', false, false)]
    local procedure OnBeforeValidateBaseUnitofMeasure(var Item: Record Item; xItem: Record Item; CallingFieldNo: Integer; var IsHandled: Boolean)
    begin
        IsHandled := true;
        /*
        here i can add logic to handle the onvalidate trigger
        */

    end;
}

