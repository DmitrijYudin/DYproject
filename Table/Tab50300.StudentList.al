/// <summary>
/// Table StudentList (ID 50300).
/// </summary>
table 50300 StudentList
{
    Caption = 'StudentList';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[120])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; Age; Integer)
        {
            Caption = 'Age';
            DataClassification = CustomerContent;
        }
        field(4; Birthday; Date)
        {
            Caption = 'Birthday';
            DataClassification = CustomerContent;
        }
    }

}
