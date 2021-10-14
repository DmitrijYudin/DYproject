codeunit 50310 TerminatePostPurchaseDoc3
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Lines Instruction Mgt.", 'OnAfterSetPurchaseLineFilters', '', false, false)]
    local procedure OnAfterSetPurchaseLineFilters(var PurchaseLine: Record "Purchase Line"; PurchaseHeader: Record "Purchase Header");
    var
        DYTemp: Record DYTemp;
    begin

        PurchaseLine.Reset();
        PurchaseLine.SetFilter("Document Type", '=%1', PurchaseHeader."Document Type");
        PurchaseLine.SetFilter("Document No.", '=%1', PurchaseHeader."No.");
        PurchaseLine.SetFilter("DY Item Approval Status", '<>%1', PurchaseLine."DY Item Approval Status"::"Approved");
        PurchaseLine.SetAutoCalcFields("DY Item Approval Status");
        //"Purchase Line".CalcFields("DY Item Approval Status");
        if PurchaseLine.FindFirst() then
            if Confirm('FindFirst No= %1 , Approval Status= %2 \ Press Yes to terminate the posting and get the error\ Press No to post without error ', false, PurchaseLine."No.", PurchaseLine."DY Item Approval Status") then
                Error('Posting Error Termination \ FindFirst No= %1 Status= %2 ', PurchaseLine."No.", PurchaseLine."DY Item Approval Status");

        //fill in DYTemp
        DYTemp.DeleteAll();
        PurchaseLine.Reset();
        PurchaseLine.SetFilter("Document Type", '=%1', PurchaseHeader."Document Type");
        PurchaseLine.SetFilter("Document No.", '=%1', PurchaseHeader."No.");
        if PurchaseLine.FindSet() then
            repeat
                DYTemp.Init();
                DYTemp."No." := PurchaseLine."No.";
                DYTemp."Item Status Approved" := PurchaseLine."DY Item Approval Status";
                DYTemp."Record No" := DYTemp.count;
                DYTemp.Insert();
            until PurchaseLine.Next() = 0;

    end;
}

// if "Purchase Line".Get(PurchaseHeader."Document Type", PurchaseHeader."No.") then
//     if Confirm('Get No= %1 , Approval Status= %2 \ Press Yes to terminate the posting and get the error\ Press No to post without error ', false, "Purchase Line"."No.", "Purchase Line"."DY Item Approval Status") then
//         Error('Posting Error Termination \ FindFirst No= %1 Status= %2 ', "Purchase Line"."No.", "Purchase Line"."DY Item Approval Status");


//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Lines Instruction Mgt.", 'OnAfterSetPurchaseLineFilters', '', false, false)]
//     local procedure OnAfterSetPurchaseLineFilters(var PurchaseLine: Record "Purchase Line"; PurchaseHeader: Record "Purchase Header");

//    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchLineDeleteAll', '', false, false)]
//   local procedure OnBeforePurchLineDeleteAll(var PurchaseLine: Record "Purchase Line"; CommitIsSupressed: Boolean);

// [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeRunPurchPost', '', false, false)]
// local procedure OnBeforeRunPurchPost(var PurchaseHeader: Record "Purchase Header");

// [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Totals", 'OnBeforeCalculatePostedPurchInvoiceTotals', '', false, false)]
// local procedure OnBeforeCalculatePostedPurchInvoiceTotals(var PurchInvHeader: Record "Purch. Inv. Header"; var VATAmount: Decimal; PurchInvLine: Record "Purch. Inv. Line"; var IsHandled: Boolean);

// [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeStartOrContinuePosting', '', false, false)]
// local procedure OnBeforeStartOrContinuePosting(var GenJnlLine: Record "Gen. Journal Line"; LastDocType: Option; LastDocNo: Code[20]; LastDate: Date; var NextEntryNo: Integer);
