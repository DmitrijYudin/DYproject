// codeunit 50309 OnBeforePurchLineDeleteAll_2
// {
//     EventSubscriberInstance = StaticAutomatic;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchLineDeleteAll', '', false, false)]
//     local procedure OnBeforePurchLineDeleteAll(var PurchaseLine: Record "Purchase Line"; CommitIsSupressed: Boolean);
//     var
//         DYTemp: Record DYTemp;
//         "Purchase Line": Record "Purchase Line";
//     begin
//         DYTemp.Init();
//         DYTemp.DeleteAll();

//         if "Purchase Line".FindSet() then
//             repeat
//                 DYTemp.Init();
//                 DYTemp.No := "Purchase Line"."No.";
//                 DYTemp."Item Status Approved" := "Purchase Line"."DY Item Approval Status";
//                 DYTemp."Record No" := DYTemp.count;
//                 DYTemp.Insert();
//             until "Purchase Line".Next() = 0;
//     end;
// }

// [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeRunPurchPost', '', false, false)]
// local procedure OnBeforeRunPurchPost(var PurchaseHeader: Record "Purchase Header");

// [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Totals", 'OnBeforeCalculatePostedPurchInvoiceTotals', '', false, false)]
// local procedure OnBeforeCalculatePostedPurchInvoiceTotals(var PurchInvHeader: Record "Purch. Inv. Header"; var VATAmount: Decimal; PurchInvLine: Record "Purch. Inv. Line"; var IsHandled: Boolean);

// [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeStartOrContinuePosting', '', false, false)]
// local procedure OnBeforeStartOrContinuePosting(var GenJnlLine: Record "Gen. Journal Line"; LastDocType: Option; LastDocNo: Code[20]; LastDate: Date; var NextEntryNo: Integer);
