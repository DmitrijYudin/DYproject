page 50308 DYRecordTest
{
    ApplicationArea = All;
    Caption = 'DYRecordTest';
    PageType = List;
    SourceTable = DYRecordTest;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("Record Text"; Rec."Text field")
                {
                    ToolTip = 'Specifies the value of the Text field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Issue 1")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    DYRecordTest1: Record DYRecordTest; // temporary;
                    DYRecordTest2: Record DYRecordTest; // temporary;
                begin

                    DYRecordTest1.DeleteAll();
                    DYRecordTest2.DeleteAll();

                    DYRecordTest1.Init();
                    DYRecordTest1."No." := 1;
                    DYRecordTest1."Text field" := 'text ini';
                    DYRecordTest1.Insert();
                    //Commit(); does not work with commit !!!!

                    DYRecordTest1.FindFirst();
                    DYRecordTest2.FindFirst();

                    DYRecordTest1."Text field" := 'text 1';
                    DYRecordTest2."Text field" := 'text 2';

                    DYRecordTest1.Modify();
                    DYRecordTest2.Modify();
                    Message('DYRecordTest1 = %1 \DYRecordTest2 = %2', DYRecordTest1."Text field", DYRecordTest2."Text field");

                end;
            }
            action("Temporary table")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    DYRecordTest1: Record DYRecordTest temporary;
                    DYRecordTest2: Record DYRecordTest temporary;
                begin

                    DYRecordTest1.DeleteAll();

                    DYRecordTest1.Init();
                    DYRecordTest1."No." := 1;
                    DYRecordTest1."Text field" := '1';
                    DYRecordTest1.Insert();


                    DYRecordTest2.Init();
                    DYRecordTest2."No." := 1;
                    DYRecordTest2."Text field" := '1';
                    DYRecordTest2.Insert();

                    DYRecordTest2.Init();
                    DYRecordTest2."No." := 2;
                    DYRecordTest2."Text field" := '2';
                    DYRecordTest2.Insert();
                    Commit();

                    Message('DYRecordTest1 = %1 \DYRecordTest2 = %2', DYRecordTest1.Count, DYRecordTest2.Count);

                end;
            }

            action("Delete All")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    DYRecordTest: Record DYRecordTest;
                begin
                    DYRecordTest.DeleteAll();
                end;
            }
        }
    }
}
