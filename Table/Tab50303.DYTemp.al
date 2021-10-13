table 50303 DYTemp
{
    Caption = 'DYTemp';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Record No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Item Status Approved"; Enum "Pending Approval")
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Item Approval Status" where("No." = field("No.")));
        }
    }
    keys
    {
        key(PK; "Record No")
        {
            Clustered = true;
        }
    }

}
