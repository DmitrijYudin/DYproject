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
        }
    }
}