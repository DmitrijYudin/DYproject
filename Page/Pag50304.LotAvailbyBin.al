page 50304 "Lot Avail. by Bin"
{

    PageType = List;
    SourceTable = "Warehouse Entry";
    SourceTableTemporary = true;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; "Item No.")
                {
                    ApplicationArea = ALL;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = ALL;
                }
                field("Bin Code"; "Bin Code")
                {
                    ApplicationArea = ALL;
                }
                field("Serial No."; "Serial No.")
                {
                    ApplicationArea = ALL;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = ALL;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        LotAvail: Query "Lot Avail. by Bin";
    begin
        LotAvail.Open();
        while LotAvail.Read() do begin
            Init();
            "Item No." := LotAvail.Item_No_;
            "Location Code" := LotAvail.Location_Code;
            "Bin Code" := LotAvail.Bin_Code;
            Quantity := LotAvail.Sum_Quantity;
            Insert();
        end;
    end;
}
