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

        field(4; "Customer Name 1"; Text[100])
        {
            Caption = 'Customer Name 1';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("No.")));
        }
        field(5; "Customer Name 2"; Text[100])
        {
            Caption = 'Customer Name 2';
            TableRelation = Customer.Name;
            DataClassification = CustomerContent;
            Editable = true;
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
