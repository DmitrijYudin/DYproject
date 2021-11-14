table 50305 DYTileView
{
    Caption = 'DYTileView';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; Number; Integer)
        {
        }

        field(2; Description; Text[50])
        {
        }
        field(3; Inventory; Integer)
        {
        }

        field(4; No; Integer)
        {
            AutoIncrement = true;
        }
        field(5; Bool1; Boolean)
        {
            InitValue = true;
        }
        field(6; Image; Media)
        {
        }
    }

    keys
    {
        key(PK; Number)
        {
        }
    }
    fieldgroups
    {
        fieldgroup(Brick; Bool1, No, Number, Inventory, Description, Image)
        {
        }
    }
}

