/// <summary>
/// TableExtension Purch. Inv. Header Ext (ID 50302) extends Record Purch. Inv. Header.
/// </summary>
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
