page 50301 "Incentive Setup"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Incentive Setup";
    Extensible = true;

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
                                Error('Sorry, but Item Category is empty. You Shoul create it first');
                            end;
                        Until SalesPersone.Next(1) = 0;
                    end else begin
                        Error('Sorry, but Salesperson/Purchaser is empty. You Shoul create it first');
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
                    SalesPersone.Init();
                    ItemCategory.Init();
                    IncentiveSetup.Init();
                    //Message(SalesPersone.Code + ': ' + SalesPersone.Name);
                    ItemCategory.SetFilter("Has Children", 'No');
                    //Message(SalesPersone.Code + ': ' + SalesPersone.Name);
                    if SalesPersone.FindSet(true, true) then begin
                        //Message(SalesPersone.Code + ': ' + SalesPersone.Name);
                        repeat
                            //Message(SalesPersone.Code + ': ' + SalesPersone.Name);
                            //ItemCategory.SetFilter("Has Children", 'No');
                            if ItemCategory.FindSet(true, true) then begin
                                //Message('ItemCategory.Code' + ': ' + ItemCategory.Code);
                                repeat
                                    //Message(ItemCategory.Code);
                                    IncentiveSetup.Init();
                                    IncentiveSetup."Sales Persone Code" := SalesPersone.Code;
                                    IncentiveSetup."Item Category Code" := ItemCategory.Code;
                                    IncentiveSetup."Incentive Pecent" := 999;
                                    IncentiveSetup.Insert();
                                Until ItemCategory.Next(1) = 0;
                            end else begin
                                Error('Sorry, but Item Category is empty. You Shoul create it first');
                            end;
                        Until SalesPersone.Next(1) = 0;
                    end else begin
                        Error('Sorry, but Salesperson/Purchaser is empty. You Shoul create it first');
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
                        Error('Sorry, but IncentiveSetup does not have DY and POPIT TOY');
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
                        Error('Sorry. There are not DY and POPIT TOY set')
                    end;
                end;
            }



            action("Issue 1")
            {
                ApplicationArea = All;
                Caption = 'Issue 1';
                trigger OnAction();
                var
                    IncentiveSetup1: Record "Incentive Setup";
                    IncentiveSetup2: Record "Incentive Setup";
                begin
                    IncentiveSetup1.Init();
                    IncentiveSetup2.Init();

                    IncentiveSetup1.FindFirst();
                    IncentiveSetup2.FindFirst();

                    IncentiveSetup1."Incentive Pecent" := 1; // в первой записи IncentiveSetup1."Incentive Pecent"= 1                    
                    IncentiveSetup2."Incentive Pecent" := 2; // в первой записи IncentiveSetup2."Incentive Pecent"= 2

                    IncentiveSetup1.Modify(); //в таблицу "Incentive Setup" переписали всю  IncentiveSetup1 и вывели на page Incentive Pecent = 1
                    IncentiveSetup2.Modify(); //в таблицу "Incentive Setup" переписали всю  IncentiveSetup1 и вывели на page Incentive Pecent = 1                    
                end;
            }
            action("Issue 2")
            {
                ApplicationArea = All;
                Caption = 'Issue 2';
                trigger OnAction();
                var
                    IncentiveSetup1: Record "Incentive Setup";
                    IncentiveSetup2: Record "Incentive Setup";
                begin
                    IncentiveSetup1.Init();
                    IncentiveSetup2.Init();

                    IncentiveSetup1.FindFirst();
                    IncentiveSetup1."Incentive Pecent" := 1; // в первой записи IncentiveSetup1."Incentive Pecent"= 1                    
                    IncentiveSetup1.Modify(); //в таблицу "Incentive Setup" переписали всю  IncentiveSetup1 и вывели на page Incentive Pecent = 1

                    IncentiveSetup2.FindFirst();
                    IncentiveSetup2."Incentive Pecent" := 2; // в первой записи IncentiveSetup2."Incentive Pecent"= 2
                    IncentiveSetup2.Modify(); //в таблицу "Incentive Setup" переписали всю  IncentiveSetup1 и вывели на page Incentive Pecent = 1                    
                end;
            }
            action("Put 5% to STUFF else 7% by logic")
            {
                ApplicationArea = All;
                Caption = 'Put 5% to STUFF else 7% by logic';
                trigger OnAction();
                var
                    IncentiveSetup: Record "Incentive Setup";
                    ItemCategory: Record "Item Category";
                    FindSTUFF: Boolean;
                begin
                    IncentiveSetup.Init();
                    ItemCategory.Init();
                    if IncentiveSetup.FindSet() then
                        repeat
                            FindSTUFF := false;
                            //ItemCategory.SetFilter("Parent Category", '%1', 'STUFF');
                            ItemCategory.SetRange("Parent Category", 'STUFF');
                            if ItemCategory.FindSet() then
                                repeat
                                    if ItemCategory.Code = IncentiveSetup."Item Category Code" then begin
                                        FindSTUFF := true;
                                        break;
                                    end;
                                until ItemCategory.Next() = 0;

                            if FindSTUFF = true then begin
                                IncentiveSetup."Incentive Pecent" := 5;
                            end else begin
                                IncentiveSetup."Incentive Pecent" := 7;
                            end;
                            IncentiveSetup.Modify()
                        until IncentiveSetup.Next() = 0;
                end;
            }

            action("Put 5% to STUFF else 7% by filters")
            {
                ApplicationArea = All;
                Caption = 'Put 5% to STUFF else 7% by filters';
                trigger OnAction();
                var
                    IncentiveSetup: Record "Incentive Setup";
                    ItemCategory: Record "Item Category";
                    FindSTUFF: Boolean;
                begin
                    IncentiveSetup.Init();
                    ItemCategory.Init();

                    ItemCategory.SetRange("Parent Category", 'STUFF');
                    if ItemCategory.FindSet() then begin
                        repeat
                            Rec.FilterGroup;
                            IncentiveSetup.SetFilter("Item Category Code", '<>%1', ItemCategory.Code);
                        until ItemCategory.Next() = 0;
                        if IncentiveSetup.FindSet() then begin
                            repeat
                                IncentiveSetup.Init();
                                IncentiveSetup."Incentive Pecent" := 7;
                                IncentiveSetup.Modify()
                            until IncentiveSetup.Next() = 0;
                        end;

                    end;
                end;
            }

            action("First line Check")
            {
                ApplicationArea = All;
                Caption = 'First line Check';
                trigger OnAction();
                var
                    IncentiveSetupCheck: Record "Incentive Setup";
                begin
                    IncentiveSetupCheck.Init();
                    IncentiveSetupCheck.FindFirst();
                    Message('IncentiveSetupCheck ' + Format(IncentiveSetupCheck."Incentive Pecent"));
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
        }
    }
}