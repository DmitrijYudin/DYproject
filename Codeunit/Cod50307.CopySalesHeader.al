codeunit 50307 "CopySalesHeader"
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", 'OnAfterCopySalesHeader', '', false, false)]
    local procedure OnAfterCopySalesHeader(var ToSalesHeader: Record "Sales Header"; OldSalesHeader: Record "Sales Header"; FromSalesHeader: Record "Sales Header");
    begin
        ToSalesHeader.DYTestTextFiel += ' Value was copied';
        Message('ToSalesHeader.DYTestTextFiel = %1 \ OldSalesHeader.DYTestTextFiel = %2 \ FromSalesHeader.DYTestTextFiel ', ToSalesHeader.DYTestTextFiel, OldSalesHeader.DYTestTextFiel, FromSalesHeader.DYTestTextFiel);
    end;


}
//   codeunit 6620
//  [IntegrationEvent(false, false)]
//   local procedure OnAfterCopySalesHeader(var ToSalesHeader: Record "Sales Header"; OldSalesHeader: Record "Sales Header"; FromSalesHeader: Record "Sales Header")
//   begin
//   end;