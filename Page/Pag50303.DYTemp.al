page 50303 DYTemp
{

    Caption = 'DYTemp';
    PageType = List;
    SourceTable = DYTemp;
    ApplicationArea = All;
    UsageCategory = Lists;
    Extensible = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Record No"; Rec."Record No")
                {
                    ApplicationArea = All;
                }
                field("No"; Rec.No)
                {
                    ApplicationArea = All;
                }
                field("Item Status Approved"; Rec."Item Status Approved")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
