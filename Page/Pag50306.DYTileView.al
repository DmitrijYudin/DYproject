page 50306 DYTileView
{
    Caption = 'DYTileView';
    PageType = List;
    SourceTable = DYTileView;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = true;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Number; Rec.Number)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                    Style = Attention;
                }
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    Style = Ambiguous;
                }
                field(Bool1; Rec.Bool1)
                {
                    ApplicationArea = All;
                    Style = StrongAccent;
                }
            }
        }
    }
}
