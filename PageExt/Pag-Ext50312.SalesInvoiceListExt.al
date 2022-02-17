pageextension 50312 "SalesInvoice ListExt" extends "Sales Invoice List"
{
    actions
    {
        addfirst(processing)
        {
            action("Change Company")
            {
                Caption = 'Change Company';
                ApplicationArea = All;

                trigger OnAction()
                var
                    CompanyInformation: Record "Company Information";
                    SalesHeader: Record "Sales Header";
                    newCompany: Text[128];
                begin
                    newCompany := 'CRONUS COPY';

                    if CompanyInformation.Get() then begin //get current company name
                        SalesHeader.SetRange("Document Type", Rec."Document Type"::Invoice);
                        if SalesHeader.FindFirst() then
                            Message('%1\ Sales Header FindFirst: %2', CompanyInformation.Name, SalesHeader."No.");
                    end;

                    if CompanyInformation.ChangeCompany(newCompany) then //change company
                        if CompanyInformation.Get() then //get new company name
                            if SalesHeader.ChangeCompany(newCompany) then begin//change company
                                SalesHeader.SetRange("Document Type", Rec."Document Type"::Invoice);
                                if SalesHeader.FindFirst() then
                                    Message('%1\ Sales Header FindFirst: %2', CompanyInformation.Name, SalesHeader."No.");
                            end;
                end;
            }

            action("SetCurrentKey")
            {
                Caption = 'SetCurrentKey';
                ApplicationArea = All;

                trigger OnAction()
                var
                    GLEntry: Record "G/L Entry";
                    GLRegister: Record "G/L Register";
                begin
                    GLEntry.SetFilter("Entry No.", '%1..%2', GLRegister."From Entry No.", GLRegister."To Entry No.");
                    GLEntry.SetFilter("Posting Date", '<%1', Today);
                end;
            }
        }
    }
}
