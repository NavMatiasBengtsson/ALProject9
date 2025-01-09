pageextension 50109 "Customer Card Ext" extends "Customer Card"
{
    actions
    {
        addafter(NewSalesOrderAddin)
        {
            action(NewSalesOrderReqDeliveryDate)
            {
                ApplicationArea = All;
                Caption = 'Sales Order with Req. Delivery Date';
                ToolTip = 'Creates a sales order for the customer also fills in with a required delivery date field';
                Image = Document;

                trigger OnAction()
                var
                    MyManualSubscriber: Codeunit "My Manual Subscriber";
                begin
                    BindSubscription(MyManualSubscriber);
                    Rec.CreateAndShowNewOrder();

                end;
            }
        }
    }


}