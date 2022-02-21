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
            action("Bob")
            {
                Caption = 'Bob';
                ApplicationArea = All;

                trigger OnAction()
                var
                    Customer: Record Customer;
                    CustomerName: Text[100];
                    CustomerName2: Text[50];
                begin
                    CustomerName := 'Bob';
                    CustomerName2 := 'Bob1';
                    Customer.SetCurrentKey(Name);
                    Customer.SetRange(Name, CustomerName);
                    //if Customer.FindSet(true, true) then // not necessary because modifyAll doesn't make an error if NO 'Bob'
                    Customer.ModifyAll("Name 2", CustomerName2);
                end;
            }
            action("SetRange")
            {
                Caption = 'SetRange';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.SetCurrentKey("Name 2");
                    Rec.Reset();
                    Message('Total = %1', Rec.Count());
                    Rec.SetRange("Name 2", 'B', 'z');
                    Message('Bob0 to Bob2 = %1', Rec.Count());
                    //Rec.SetRange("Name 2", 'Bob2');
                    // Message('Bob2 = %1', Rec.Count());
                    // Message(StrSubstNo('Bob2 = %1', Rec.Count()))
                end;
            }
            action("Next")
            {
                Caption = 'Next';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetCurrentKey("No.");
                    if Rec.FindSet(false, false) then begin
                        Rec.Next(9);
                        Message('No.=%1', Rec."No.");
                    end;
                end;
            }
            action("SetCurrentKey")
            {
                Caption = 'SetCurrentKey';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.Reset();
                    //Rec.SetCurrentKey("No.");
                    Rec.SetRange("No.");
                    if Rec.FindFirst() then
                        Message(Format(Rec."No."));


                    Rec.Reset();
                    //Rec.SetCurrentKey("No.");
                    Rec.SetRange("No.");
                    Rec.SetAscending("No.", false);

                    if Rec.FindFirst() then begin
                        Message(Format(Rec."No."));
                    end;

                end;
            }

            action("RecordRef Open")
            {
                Caption = 'RecordRef Open';
                ApplicationArea = All;

                trigger OnAction()
                var
                    MyRecordRef: RecordRef;
                    Text000: Label 'The %1 table contains %2 records.';
                begin
                    MyRecordRef.Open(Database::Customer);
                    Message(Text000, MyRecordRef.Caption, MyRecordRef.Count);
                    MyRecordRef.Close;
                end;
            }
            action("RecordRef GetTable")
            {
                Caption = 'RecordRef Get';
                ApplicationArea = All;

                trigger OnAction()
                var
                    Customer: Record Customer;
                    CustomerRef: RecordRef;
                    CustomerFieldRef: FieldRef;
                    Text000: Label 'The %1 table contains %2 records.';
                begin
                    Customer.Get('10000');
                    CustomerRef.GetTable(Customer);
                    CustomerFieldRef := CustomerRef.Field(4);
                    CustomerFieldRef.Validate('Ref GetTable');
                    CustomerRef.Modify()
                end;
            }
            action("Calc Date")
            {
                Caption = 'Calc Date';
                ApplicationArea = All;

                trigger OnAction()
                var
                    Text000: Label 'Today %1 \Yesterday %2';
                begin
                    Message(Text000, FORMAT(Today), FORMAT(CalcDate('-1D', Today)));
                end;
            }
        }
    }
}
