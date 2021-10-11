pageextension 50310 "PostedPurchInvoiceSubformExt" extends "Posted Purch. Invoice Subform"
{
    layout
    {
        addfirst(Control1)
        {
            field("Item Approval Status"; Rec."DY Item Approval Status")
            {
                Visible = true;
                ApplicationArea = all;
            }
        }
    }
}
