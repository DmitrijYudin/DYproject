/// <summary>
/// PageExtension Posted Purchase Invoice Ext (ID 50305) extends Record Posted Purchase Invoice.
/// </summary>
pageextension 50305 "Posted Purchase Invoice Ext" extends "Posted Purchase Invoice"
{
    layout
    {
        addlast(General)
        {
            field("CRM No."; Rec."CRM No.")
            {
                Visible = true;
                ApplicationArea = all;
            }
        }
    }

}