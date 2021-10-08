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