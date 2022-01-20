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
                field("Record Text"; Rec."Record Text")
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
            action(Test1)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    DYRecordTest1: Record DYRecordTest; //temporary;
                    DYRecordTest2: Record DYRecordTest; //temporary;
                begin
                    DYRecordTest1.Init();
                    DYRecordTest1."No." := '1';
                    DYRecordTest1."Record Text" := '0';
                    DYRecordTest1.Insert();

                    DYRecordTest1.FindFirst();
                    DYRecordTest2.FindFirst();

                    DYRecordTest1."Record Text" := '1';
                    DYRecordTest2."Record Text" := '2';

                    DYRecordTest1.Modify();
                    DYRecordTest2.Modify();

                    Message('DYRecordTest1 = %1 , DYRecordTest1 = %2', DYRecordTest1."Record Text", DYRecordTest2."Record Text");

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
