tableextension 50304 "Purchase Line Ext" extends "Purchase Line"
{
    fields
    {
        field(50300; "DY Item Approval Status"; Enum "Pending Approval")
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Item Approval Status" where("No." = field("No.")));
        }
    }
}
