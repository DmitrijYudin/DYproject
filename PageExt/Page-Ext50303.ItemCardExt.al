/// <summary>
/// PageExtension ItemCardExt (ID 50303) extends Record Item Card.
/// </summary>
pageextension 50303 "ItemCardExt" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("Item Approval Status"; Rec."Item Approval Status")
            {
                Caption = 'DY Item Approval Status';
                Visible = true;
                ApplicationArea = all;
            }
        }
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