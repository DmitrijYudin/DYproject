table 50302 "Flow Fields"
{
    Caption = 'Flow Fields';
    fields
    {
        field(1; "Custimer No."; Code[20])
        {
            Caption = 'Custimer No.';
            TableRelation = Customer."No.";
        }
        field(2; "Customer Name"; Text[256])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Custimer No.")));
        }
        field(3; "Invoices Total"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Cust. Ledger Entry"."Sales (LCY)" where("Document Type" = const(Invoice), "Customer No." = field("Custimer No.")));
        }

    }
    keys
    {
        key(PK; "Custimer No.")
        {

        }
    }

}
