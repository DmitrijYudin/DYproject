tableextension 50305 "Purch. Inv. Line Ext" extends "Purch. Inv. Line"
{
    fields
    {
        field(50300; "DY Item Approval Status"; Enum "Pending Approval")
        {
            Caption = 'DY Item Approval Status';
            DataClassification = ToBeClassified;
        }
    }
}
