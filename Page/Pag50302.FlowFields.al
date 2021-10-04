page 50302 "Flow Fields"
{
    PageType = List;
    SourceTable = "Flow Fields";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Custimer No."; Rec."Custimer No.")
                {
                    ApplicationArea = all;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = all;
                }
                field("Invoices Total"; Rec."Invoices Total")
                {
                    ApplicationArea = all;
                }
            }
        }
    }



}