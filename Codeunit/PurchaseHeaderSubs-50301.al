codeunit 50301 PurchaseHeaderSubs
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, DataBase::"Purchase Header", 'OnAfterValidateEvent', 'Vendor Invoice No.', true, true)]
    procedure VendorInvoiceNoOnValidate(Var Rec: Record "Purchase Header"; xRec: Record "Purchase Header"; CurrFieldNo: Integer)
    begin
        //Rec."Vendor Shipment No." := Rec."Vendor Invoice No.";
        Message('Warning !\' + 'According to Task 1 GM "Vendor Shipment No." and "CRM No." will be changed to "Vendor Shipment No." automatically');

        Rec.Validate("Vendor Shipment No.", Rec."Vendor Invoice No.");

        Message('"Vendor Shipment No."= %1 was changed to %2', xRec."Vendor Shipment No.", Rec."Vendor Shipment No.");
        Message('"Vendor Invoice No."= %1 was changed to %2', xRec."Vendor Invoice No.", Rec."Vendor Invoice No.");

        Rec.Validate("CRM No.", Rec."Vendor Shipment No.");
        //Rec."CRM No." := Rec."Vendor Shipment No."
        //Rec.Modify()

    end;
}