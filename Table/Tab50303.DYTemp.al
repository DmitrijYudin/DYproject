table 50303 DYTemp
{
    Caption = 'DYTemp';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Record No"; Integer)
        {
            Caption = 'Record No';
            DataClassification = ToBeClassified;
        }
        field(2; "No"; Integer)
        {
            Caption = 'No';
            DataClassification = ToBeClassified;
        }
        field(3; "Item Status Approved"; Enum "Pending Approval")
        {
            Caption = 'Item Status Approved';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Record No","Item Status Approved")
        {
            Clustered = true;
        }
    }
    
}
