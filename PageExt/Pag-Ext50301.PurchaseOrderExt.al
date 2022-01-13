
pageextension 50302 PurchaseOrderExt extends "Purchase Order" //OriginalId
{
    layout
    {
        addafter(BuyFromContactEmail)
        {
            field("CRM No."; Rec."CRM No.")
            {
                Visible = true;
                ApplicationArea = all;
            }
            field(VendorQuality; Rec.VendorQuality)
            {
                Caption = 'Vendor Quality';
                ApplicationArea = all;
            }
        }
    }
}




