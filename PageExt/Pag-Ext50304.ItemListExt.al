/// <summary>
/// PageExtension Item List Ext (ID 50304) extends Record Item List.
/// </summary>
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