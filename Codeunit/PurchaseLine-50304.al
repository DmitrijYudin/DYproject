codeunit 50304 PurchaseLineDelete50304
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, DataBase::"Purchase Line", 'OnAfterDeleteEvent', '', true, true)]
    //procedure "InsertPurchesOrderMessage"(Var Rec: Record "Purchase Header"; xRec: Record "Purchase Header"; CurrFieldNo: Integer)
    procedure "PurchaseLineDelete"(Var Rec: Record "Purchase Line"; RunTrigger: Boolean)
    begin

        Message('Purchase Line No. "%1" was deleted', Rec."No.");

    end;
}
