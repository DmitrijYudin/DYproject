tableextension 50304 "Purchase Line Ext" extends "Purchase Line"
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
