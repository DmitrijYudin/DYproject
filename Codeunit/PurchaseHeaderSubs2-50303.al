codeunit 50303 PurchaseHeaderSubs50303
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, DataBase::"Purchase Header", 'OnAfterInsertEvent', '', true, true)]
    procedure "InsertPurchesOrderMessage"(Var Rec: Record "Purchase Header"; RunTrigger: Boolean)
    begin

        Message('New Purchase Order was created');

    end;
}