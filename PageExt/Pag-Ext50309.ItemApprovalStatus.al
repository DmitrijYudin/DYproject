pageextension 50309 "Item Approval Status" extends "Purch. Invoice Subform"
{
    layout
    {
        addfirst(PurchDetailLine)
        {
            field("Item Approval Status"; Rec."DY Item Approval Status")
            {
                Visible = true;
                ApplicationArea = all;
            }
        }
    }
}