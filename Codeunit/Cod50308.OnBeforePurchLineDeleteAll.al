codeunit 50308 OnBeforePurchLineDeleteAll
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchLineDeleteAll', '', false, false)]
    local procedure OnBeforePurchLineDeleteAll(var PurchaseLine: Record "Purchase Line"; CommitIsSupressed: Boolean);
    var
        DYTemp: Record DYTemp;
    //"Purchase Line": Record "Purchase Line";
    begin
        DYTemp.Init();
        DYTemp.DeleteAll();

        if PurchaseLine.FindSet() then
            repeat
                DYTemp.Init();
                DYTemp.No := PurchaseLine."No.";
                DYTemp."Item Status Approved" := PurchaseLine."DY Item Approval Status";
                DYTemp."Record No" := DYTemp.count;
                DYTemp.Insert();
            until PurchaseLine.Next() = 0;

        PurchaseLine.SetFilter("DY Item Approval Status", '<>%1', PurchaseLine."DY Item Approval Status"::"Approved");
        if PurchaseLine.FindFirst() then
            if Confirm('FindFirst No= %1 , Approval Status= %2 \ Press Yes to terminate the posting and get the error\ Press No to post without error ', false, PurchaseLine."No.", PurchaseLine."DY Item Approval Status") then
                Error('OnBeforePurchLineDeleteAll \ FindFirst No= %1 Status= %2 ', PurchaseLine."No.", PurchaseLine."DY Item Approval Status")
    end;
}

// [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeRunPurchPost', '', false, false)]
// local procedure OnBeforeRunPurchPost(var PurchaseHeader: Record "Purchase Header");

// [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Totals", 'OnBeforeCalculatePostedPurchInvoiceTotals', '', false, false)]
// local procedure OnBeforeCalculatePostedPurchInvoiceTotals(var PurchInvHeader: Record "Purch. Inv. Header"; var VATAmount: Decimal; PurchInvLine: Record "Purch. Inv. Line"; var IsHandled: Boolean);

// [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeStartOrContinuePosting', '', false, false)]
// local procedure OnBeforeStartOrContinuePosting(var GenJnlLine: Record "Gen. Journal Line"; LastDocType: Option; LastDocNo: Code[20]; LastDate: Date; var NextEntryNo: Integer);