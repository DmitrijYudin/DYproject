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
                field("No"; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Item Status Approved"; Rec."Item Status Approved")
                {
                    ApplicationArea = All;
                }
                field("Customer Name 1"; Rec."Customer Name 1")
                {
                    ToolTip = 'Specifies the value of the Customer Name 1 field.';
                    ApplicationArea = All;
                }
                field("Customer Name 2"; Rec."Customer Name 2")
                {
                    ToolTip = 'Specifies the value of the Customer Name 2 field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
