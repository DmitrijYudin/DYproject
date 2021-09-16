/// <summary>
/// TableExtension PurchaseHeaderExt (ID 50300) extends Record Purchase Header.
/// </summary>
tableextension 50300 PurchaseHeaderExt extends "Purchase Header"
{
    fields
    {
        field(50300; "CRM No."; Code[20])
        {
            Caption = 'CRM No.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                Message('CRM No. "%1" was changed to "%2" ', xRec."CRM No.", Rec."CRM No.");
            end;
        }

        field(50301; "VendorQuality"; Enum VendorQuality)
        {
            Caption = 'Vendor Quality';
            DataClassification = CustomerContent;
        }
    }
}
