/// <summary>
/// PageExtension PurchaseOrderListExt (ID 50301) extends Record Purchase Order List.
/// </summary>
pageextension 50301 PurchaseOrderListExt extends "Purchase Order List"
{
    layout
    {
        addlast(Control1)
        {
            field("CRM No."; Rec."CRM No.")
            {
                Visible = true;
                ApplicationArea = all;
            }

            field(VendorQuality; Rec.VendorQuality)
            {
                Visible = true;
                ApplicationArea = all;
            }
            field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
            {
                Visible = true;
                ApplicationArea = all;
            }
        }
    }
}