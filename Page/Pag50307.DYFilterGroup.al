page 50307 DYFilterGroup
{

    PageType = List;
    SourceTable = Item;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = true;
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = all;
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Set Filters")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.FilterGroup(10);
                    Rec.SetRange("Base Unit of Measure", 'KG');
                    Rec.FilterGroup(0);
                end;
            }
        }
    }
}
