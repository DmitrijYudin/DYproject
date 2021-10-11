codeunit 50308 OnBeforePostedPurchaseInvoise
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Totals", 'OnBeforeCalculatePostedPurchInvoiceTotals', '', false, false)]
    local procedure OnBeforeCalculatePostedPurchInvoiceTotals(var PurchInvHeader: Record "Purch. Inv. Header"; var VATAmount: Decimal; PurchInvLine: Record "Purch. Inv. Line"; var IsHandled: Boolean);
    var
        "Purchase Line": Record "Purchase Line";
    begin

        "Purchase Line".SetFilter("DY Item Approval Status", '<>%1', "Purchase Line"."DY Item Approval Status"::"Approved");
        if "Purchase Line".FindFirst() then
            //Message('Items Approval Status: Pending Approval or not set')
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
            Message(' OnBeforeRunPurchPost find No=%1 Status= %2', "Purchase Line"."No.", "Purchase Line"."DY Item Approval Status")
        else
            Message(' OnBeforeRunPurchPost Items Approval Status: Approved')
    end;

}

