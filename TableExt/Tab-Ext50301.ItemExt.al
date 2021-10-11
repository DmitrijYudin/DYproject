/// <summary>
/// TableExtension ItemExt (ID 50301) extends Record Item.
/// </summary>
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
            Caption = 'Pending Approval';
            DataClassification = ToBeClassified;
        }
    }

}