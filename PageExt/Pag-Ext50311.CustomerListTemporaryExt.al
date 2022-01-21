pageextension 50311 "Customer List Temporary Ext" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action("Temporary Customer")
            {
                Caption = 'Temporary Customer';
                ApplicationArea = All;

                trigger OnAction()
                var
                    TempCustomer: Record Customer temporary;
                    Customer: Record Customer;
                begin
                    TempCustomer.Init();
                    TempCustomer."No." := '10000';
                    TempCustomer.Insert();
                    TempCustomer.Init();
                    TempCustomer."No." := '20000';
                    TempCustomer.Insert();
                    TempCustomer.Init();
                    TempCustomer."No." := '30000';
                    TempCustomer.Insert();
                    // TempCustomer.Init();
                    // TempCustomer."No." := '40000';
                    // TempCustomer.Insert();

                    if Customer.Get('40000') then begin
                        TempCustomer.TransferFields(Customer);
                        TempCustomer.Insert()
                    end;

                    Page.Run(50309, TempCustomer);
                end;
            }
        }
    }
}
