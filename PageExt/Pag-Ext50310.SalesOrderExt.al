
pageextension 50310 SalesOrderExt extends "Sales Order"
{
    layout
    {
        addafter(Status)
        {
            field(isAPI; Rec.isAPI)
            {
                Caption = 'DY API';
                Visible = true;
                ApplicationArea = all;
            }
        }
        modify("Invoice Details")
        {
            Editable = not Rec.isAPI;
        }

    }
    trigger OnOpenPage();
    begin
        CurrPage.Editable := not Rec.isAPI;
    end;
}