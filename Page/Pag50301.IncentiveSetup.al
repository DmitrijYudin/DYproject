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
                    //SalesPersone.SetRange(Code, 'DY');

                    if not SalesPersone.IsEmpty then begin
                        if not ItemCategory.IsEmpty then begin
                            if IncentiveSetup.IsEmpty then begin
                                If SalesPersone.FindSet() then
                                    repeat
                                        if ItemCategory.FindSet() then
                                            repeat
                                                Message('Just do something important !!!');
                                            until ItemCategory.Next() = 0;
                                    until SalesPersone.Next() = 0;
                            end else begin
                                Message('IncentiveSetup is not empty');
                                //
                            end;
                        end else begin
                            Message('ItemCategory IsEmptyy');
                            // 
                        end;
                    end else begin
                        Message('SalesPersone IsEmpty');
                        // 
                    end;
                end;
                        
                

                    //SalesPersone.SetFilter(Code, '%1|%2', 'DY', 'AH');
                    if SalesPersone.FindSet(true, true) then begin
                        Message('You are going to create the Incentive Setup');
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
                                Message('Sorry but Item Category is empty. You Shoul create it first');
                            end;
                        Until SalesPersone.Next(1) = 0;
                    end else begin
                        Message('Sorry but Salesperson/Purchaser is empty. You Shoul create it first');
                    end;

                end;
            }
        }
    }
}