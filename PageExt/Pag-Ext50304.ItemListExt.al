pageextension 50304 "Item List Ext" extends "Item List"
{
    layout
    {
        addlast(Control1)
        {
            field("Last Counted"; Rec."Last Counted")
            {
                Visible = true;
                ApplicationArea = all;
            }
        }
    }
}