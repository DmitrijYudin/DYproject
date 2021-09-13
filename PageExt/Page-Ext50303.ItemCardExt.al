/// <summary>
/// PageExtension ItemCardExt (ID 50303) extends Record Item Card.
/// </summary>
pageextension 50303 "ItemCardExt" extends "Item Card"
{
    layout
    {
        addlast(InventoryGrp)
        {
            field("Last Counted"; Rec."Last Counted")
            {
                Visible = true;
                ApplicationArea = all;
            }
        }
    }
}