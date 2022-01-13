pageextension 50311 CustomerListExtTemporary extends "Customer List"
{
    trigger OnOpenPage()
    var
        tempCustomer: Record Customer temporary;
        Customer: Record Customer;
    begin
        tempCustomer.Insert(true,true);
        // Message('Customer = %1', Customer.Count());
        // if Customer.FindFirst() then
        //     Message('Customer.FindFirst No = %1', Customer."No.");

        //Message('tempCustomer = %1', tempCustomer.Count());
        // tempCustomer.SetFilter("No.", '>=0');
        // if tempCustomer.FindFirst() then
        //     Message('tempCustomer.FindFirst No = %1', tempCustomer."No.");

    end;
}
