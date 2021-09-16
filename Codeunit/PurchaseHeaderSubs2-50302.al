codeunit 50302 PurchaseHeaderSubs2
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, DataBase::"Purchase Header", 'OnAfterValidateEvent', 'Buy-from Address', true, true)]
    procedure "VendorBuy-from Address OnValidate"(Var Rec: Record "Purchase Header"; xRec: Record "Purchase Header"; CurrFieldNo: Integer)
    begin

        Message('Warning !\' + 'According to Home Task 1 GM "Buy-from Address" and "Buy-from Address 2" will be changed to identical automatically');

        Rec.Validate(Rec."Buy-from Address 2", Rec."Buy-from Address");

        Message('"Buy-from Address"= %1 was changed to %2 \ "Buy-from Address 2"= %3 was changed to %4', xRec."Buy-from Address", Rec."Buy-from Address", xRec."Buy-from Address 2", Rec."Buy-from Address 2");


    end;
}