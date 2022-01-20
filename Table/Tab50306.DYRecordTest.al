table 50306 DYRecordTest
{
    Caption = 'DYRecordTest';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Text[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Record Text"; Text[250])
        {
            Caption = 'Text';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
