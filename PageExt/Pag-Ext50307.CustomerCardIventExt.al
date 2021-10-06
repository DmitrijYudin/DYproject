// pageextension 50307 "Customer Card Ivent Ext" extends "Customer Card"
// {
//     layout
//     {
//         modify(Address)
//         {
//             trigger OnBeforeValidate();
//             var
//                 line: Text[100];
//             begin
//                 line := Rec.Address;
//                 if (STRPOS(line, '+') > 0) then begin
//                     MESSAGE('DY: Can''t use a plus sign (+) in the address [' + line + ']');
//                 end;
//             end;
//         }
//     }
// }

// The following code extends the Customer Card page to raise the `OnAddressLineChanged` event
// when the Address field is changed.
pageextension 50307 MyCustomerExt extends "Customer Card"
{
    layout
    {
        modify(Address)
        {
            trigger OnBeforeValidate();
            var
                Publisher: Codeunit DYPublishers;
            begin
                Publisher.DYOnAddressLineChanged(Rec.Address);
            end;
        }
    }
}