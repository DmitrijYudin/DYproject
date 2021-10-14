pageextension 50306 "Posted Purch. Invoice Subform" extends "Posted Purch. Invoice Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Item Approval Status"; Rec."DY Item Approval Status")
            {
                Visible = true;
                ApplicationArea = all;
            }
        }
    }
}
