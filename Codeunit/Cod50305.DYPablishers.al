// The following code creates codeunit that publishes the `OnAddressLineChanged` event.
codeunit 50305 DYPublishers
{
    Access = Public;
    Subtype = Test;


    [IntegrationEvent(false, false)]
    procedure DYOnAddressLineChanged(line: Text[100]);
    begin

    end;
}
