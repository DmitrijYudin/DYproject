
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
        modify("Shortcut Dimension 1 Code")
        {
            Editable = not Rec.isAPI;
        }
    }
    trigger OnOpenPage();
    begin
        CurrPage.Editable := not Rec.isAPI;
    end;

    trigger OnModifyRecord(): Boolean
    var
        isAPIErr: Label 'Ypu can''t modifi data because API=%1', Locked = true;
    begin
        if Rec.isAPI then
            Error(isAPIErr, Rec.isAPI);
    end;
}