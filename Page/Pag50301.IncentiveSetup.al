page 50301 "Incentive Setup"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Incentive Setup";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Sales Persone Code"; Rec."Sales Persone Code")
                {
                    ApplicationArea = All;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;

                }
                field("Incentive Pecent"; Rec."Incentive Pecent")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Create Incentive Setup")
            {
                ApplicationArea = All;
                Caption = 'Create Incentive Setup';
                trigger OnAction();
                var
                    SalesPersone: Record "Salesperson/Purchaser";
                    ItemCategory: Record "Item Category";
                    IncentiveSetup: Record "Incentive Setup";
                begin


                    //SalesPersone.SetFilter(Code, '%1|%2', 'DY', 'AH');
                    if SalesPersone.FindSet(true, true) then begin
                        repeat
                            // Message(SalesPersone.Code + ': ' + SalesPersone.Name);
                            if ItemCategory.FindSet(true, true) then begin
                                repeat
                                    //Message(ItemCategory.Code);
                                    if ItemCategory."Parent Category" <> '' then begin
                                        IncentiveSetup.Init();
                                        IncentiveSetup."Sales Persone Code" := SalesPersone.Code;
                                        IncentiveSetup."Item Category Code" := ItemCategory.Code;
                                        IncentiveSetup.Insert();
                                    end;
                                Until ItemCategory.Next(1) = 0;
                            end else begin
                                Message('Sorry, but Item Category is empty. You Shoul create it first');
                            end;
                        Until SalesPersone.Next(1) = 0;
                    end else begin
                        Message('Sorry, but Salesperson/Purchaser is empty. You Shoul create it first');
                    end;

                end;
            }

            action("Create Incentive Setup with filter")
            {
                ApplicationArea = All;
                Caption = 'Create Incentive Setup with filter';
                trigger OnAction();
                var
                    SalesPersone: Record "Salesperson/Purchaser";
                    ItemCategory: Record "Item Category";
                    IncentiveSetup: Record "Incentive Setup";
                begin


                    //SalesPersone.SetFilter(Code, '%1|%2', 'DY', 'AH');
                    ItemCategory.SetFilter("Has Children", 'No');
                    if SalesPersone.FindSet(true, true) then begin
                        repeat
                            //Message(SalesPersone.Code + ': ' + SalesPersone.Name);
                            //ItemCategory.SetFilter("Has Children", 'No');
                            if ItemCategory.FindSet(true, true) then begin
                                repeat
                                    //Message(ItemCategory.Code);
                                    IncentiveSetup.Init();
                                    IncentiveSetup."Sales Persone Code" := SalesPersone.Code;
                                    IncentiveSetup."Item Category Code" := ItemCategory.Code;
                                    IncentiveSetup.Insert();
                                Until ItemCategory.Next(1) = 0;
                            end else begin
                                Message('Sorry, but Item Category is empty. You Shoul create it first');
                            end;
                        Until SalesPersone.Next(1) = 0;
                    end else begin
                        Message('Sorry, but Salesperson/Purchaser is empty. You Shoul create it first');
                    end;

                end;
            }



            action("Put 10% to not DY and not Popit Toy by Filter")
            {
                ApplicationArea = All;
                Caption = 'Put 10% to not DY and not Popit Toy by Filter';
                trigger OnAction();
                var
                    //SalesPersone: Record "Salesperson/Purchaser";
                    //ItemCategory: Record "Item Category";
                    IncentiveSetup: Record "Incentive Setup";
                begin
                    IncentiveSetup.Init();
                    IncentiveSetup.SetFilter("Sales Persone Code", '%1', 'DY');
                    IncentiveSetup.SetFilter("Item Category Code", '%1', 'POPIT TOY');
                    if IncentiveSetup.FindSet(true, true) then begin
                        repeat
                            IncentiveSetup.Init();
                            IncentiveSetup."Incentive Pecent" := 10;
                            IncentiveSetup.Modify();
                        Until IncentiveSetup.Next() = 0;
                    end else begin
                        Message('Sorry, but IncentiveSetup does not have DY and POPIT TOY');
                    end;

                end;
            }

            action("Put 10% to DY and Popit Toy by Key")
            {
                ApplicationArea = All;
                Caption = 'Put 10% to DY and Popit Toy by Key';
                trigger OnAction();
                var
                    IncentiveSetup: Record "Incentive Setup";
                begin
                    IncentiveSetup.Init();
                    if IncentiveSetup.Get('DY', 'POPIT TOY') then begin
                        IncentiveSetup."Incentive Pecent" := 10;
                        IncentiveSetup.Modify()
                    end else begin
                        Message('Sorry')
                    end;
                end;
            }

            action("Delete all data")
            {
                ApplicationArea = All;
                Caption = 'Delete all data';
                trigger OnAction();
                var
                    IncentiveSetup: Record "Incentive Setup";
                begin
                    IncentiveSetup.Init();
                    IncentiveSetup.DeleteAll();
                end;
            }

            action("Temp 1")
            {
                ApplicationArea = All;
                Caption = 'Temp 1';
                trigger OnAction();
                var
                    IncentiveSetup1: Record "Incentive Setup";
                    IncentiveSetup2: Record "Incentive Setup";
                //IncentiveSetup1 и IncentiveSetup2 перменные типа RECORD которые похожи на таблицы и 
                //являются полными копиями таблицы "Incentive Setup" где все "Incentive Pecent"=0
                begin
                    IncentiveSetup1.Init();
                    IncentiveSetup2.Init();

                    IncentiveSetup1.FindFirst(); //нашли первую запись в IncentiveSetup1
                    IncentiveSetup1."Incentive Pecent" := 1; // в первой записи IncentiveSetup1."Incentive Pecent"= 1
                    IncentiveSetup1.Modify(); //в таблицу "Incentive Setup" переписали всю  IncentiveSetup1 и вывели на page Incentive Pecent = 1
                    Message('IncentiveSetup1 ' + Format(IncentiveSetup1."Incentive Pecent")); //1
                    Message('IncentiveSetup2 ' + Format(IncentiveSetup2."Incentive Pecent")); //0

                    IncentiveSetup2.FindFirst();//нашли первую запись в IncentiveSetup2
                    IncentiveSetup2."Incentive Pecent" := 2; // в первой записи IncentiveSetup2."Incentive Pecent"= 2
                    IncentiveSetup2.Modify(); //в таблицу "Incentive Setup" переписали всю  IncentiveSetup1 и вывели на page Incentive Pecent = 1
                    Message('IncentiveSetup1 ' + Format(IncentiveSetup1."Incentive Pecent")); //1
                    Message('IncentiveSetup2 ' + Format(IncentiveSetup2."Incentive Pecent")); //2
                    // в итоге: 
                    // первая запись в таблице "Incentive Setup" = 2
                    // первая запись в переменной IncentiveSetup1 = 1
                    // первая запись в переменной IncentiveSetup2 = 2
                    // на page выводится последняя модификация IncentiveSetup2 = 2
                end;
            }


            action("Temp 1 Check")
            {
                ApplicationArea = All;
                Caption = 'Temp 1 Check"';
                trigger OnAction();
                var
                    IncentiveSetupCheck: Record "Incentive Setup";
                begin
                    IncentiveSetupCheck.Init();

                    IncentiveSetupCheck.FindFirst();
                    Message('IncentiveSetupCheck ' + Format(IncentiveSetupCheck."Incentive Pecent"));
                end;
            }
        }
    }
}