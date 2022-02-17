tableextension 50301 ItemExt extends Item
{
    fields
    {
        field(50300; "Last Counted"; Date)
        {
            Caption = 'Last Counted';
            DataClassification = ToBeClassified;
        }

        field(50301; "Item Approval Status"; Enum "Pending Approval")
        {
            DataClassification = ToBeClassified;
        }
    }
}