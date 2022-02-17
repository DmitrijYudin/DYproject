tableextension 50303 SalesHeaderExt extends "Sales Header"
{
    fields
    {
        field(50300; DYTestTextFiel; Text[200])
        {
            Caption = 'DYTestTextFiel';
            DataClassification = ToBeClassified;
        }
        field(50301; isAPI; Boolean)
        {
            Caption = 'API';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(key1; isAPI)
        {
        }
    }
}
