codeunit 50308 OnBeforePostedPurchaseInvoise
{
    EventSubscriberInstance = StaticAutomatic;

    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Totals", 'OnBeforeCalculatePostedPurchInvoiceTotals', '', false, false)]
    local procedure OnBeforeCalculatePostedPurchInvoiceTotals(var PurchInvHeader: Record "Purch. Inv. Header"; var VATAmount: Decimal; PurchInvLine: Record "Purch. Inv. Line"; var IsHandled: Boolean);
    var
        "Purchase Line": Record "Purchase Line";
    begin

        "Purchase Line".SetFilter("DY Item Approval Status", '<>%1', "Purchase Line"."DY Item Approval Status"::"Approved");
        if "Purchase Line".FindFirst() then
            Message('find No=%1 Status= %2', "Purchase Line"."No.", "Purchase Line"."DY Item Approval Status")
        else
            Message('Items Approval Status: Approved')
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeRunPurchPost', '', false, false)]
    local procedure OnBeforeRunPurchPost(var PurchaseHeader: Record "Purchase Header");
     var
        "Purchase Line": Record "Purchase Line";
    begin

        "Purchase Line".SetFilter("DY Item Approval Status", '<>%1', "Purchase Line"."DY Item Approval Status"::"Approved");
        if "Purchase Line".FindFirst() then
            Message('find No=%1 Status= %2', "Purchase Line"."No.", "Purchase Line"."DY Item Approval Status")
        else
            Message('Items Approval Status: Approved')
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeStartOrContinuePosting', '', false, false)]
    local procedure OnBeforeStartOrContinuePosting(var GenJnlLine: Record "Gen. Journal Line"; LastDocType: Option; LastDocNo: Code[20]; LastDate: Date; var NextEntryNo: Integer);
    begin
    end;



}

