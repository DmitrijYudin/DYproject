table 50304 DYPermissionTest1
{
    Caption = 'DYPermissionTest1';
    DataClassification = ToBeClassified;
    //Permissions = tabledata DYPermissionTest1 = R;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }

        field(2; "Custimer No."; Code[20])
        {
            Caption = 'Custimer No.';
            TableRelation = Customer."No.";
        }
        field(3; Age; Integer)
        {
            Caption = 'Age';
            DataClassification = CustomerContent;
        }
    }
}

