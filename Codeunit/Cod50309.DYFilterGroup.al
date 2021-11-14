codeunit 50309 DYFilterGroup
{
    TableNo = Item;
    Description = 'codeunit 50309 DYFilterGroup';

    trigger OnRun()
    begin
        Message('codeunit 50309 DYFilterGroup');
        Rec.FILTERGROUP(0);
        Rec.SetRange("Base Unit of Measure", 'KG');
        Page.Run(50307, Rec);
    end;
}
