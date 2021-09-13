tableextension 50302 "Purch. Inv. Header Ext" extends "Purch. Inv. Header"
{
    fields
    {
        field(50300; "CRM No."; Code[20])
        {
            Caption = 'CRM No.';
            DataClassification = CustomerContent;
        }
    }
}
