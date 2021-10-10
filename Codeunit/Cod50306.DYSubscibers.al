/// <summary>
/// Codeunit MySubscribers (ID 50306).
/// </summary>

// The following code creates an event subscriber codeunit.
// It declares the `CheckAddressLine` event subscriber that listens for OnAddressLineChanged event.
// The event subscriber displays a message in the client when '+' is used in the **Address** field.

codeunit 50306 MySubscribers
{
    EventSubscriberInstance = StaticAutomatic;

    /// <summary>
    /// CheckAddressLine.
    /// </summary>
    /// <param name="line">Text[100].</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"DYPublishers", 'DYOnAddressLineChanged', '', true, true)]
    procedure CheckAddressLine(line: Text[100]);
    begin
        if (STRPOS(line, '+') > 0) then begin
            MESSAGE('DY : Can''t use a plus sign (+) in the address [' + line + ']');
        end;
    end;
}
