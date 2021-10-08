pageextension 50306 "Posted Purchase Invoices Ext" extends "Posted Purchase Invoices"
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
        }
    }

}