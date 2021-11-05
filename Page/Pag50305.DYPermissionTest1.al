page 50305 DYPermissionTest1
{

    Caption = 'DYPermissionTest1';
    PageType = List;
    SourceTable = DYPermissionTest1;
    ApplicationArea = All;
    UsageCategory = Lists;
    Extensible = true;
    Permissions = tabledata DYPermissionTest1 = R;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Custimer No."; Rec."Custimer No.")
                {
                    ApplicationArea = All;
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        // ReadPermission;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        //ReadPermission;
    end;

}
