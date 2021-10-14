tableextension 50305 "Purch. Inv. Line Ext" extends "Purch. Inv. Line"
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
