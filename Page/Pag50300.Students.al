/// <summary>
/// Page Students (ID 50300).
/// </summary>
/// test commit 1
page 50300 Students
{

    ApplicationArea = All;
    Caption = 'Students';
    PageType = List;
    SourceTable = StudentList;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    // Visible = true;
                    //ToolTip = 'Specifies the value of the No. field';
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    //ToolTip = 'Specifies the value of the Name field';
                    ApplicationArea = All;
                }
                field(Age; Rec.Age)
                {
                    //ToolTip = 'Specifies the value of the Age field';
                    ApplicationArea = All;
                }
                field(Birthday; Rec.Birthday)
                {
                    //ToolTip = 'Specifies the value of the Birthday field';
                    ApplicationArea = All;
                }
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(CustomerCopy)
            {
                ApplicationArea = All;
                Caption = 'Caption', comment = 'NLB="YourLanguageCaption"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                //Image = Image;

                trigger OnAction()
                // var
                //     StudentsLocal: Record Customer; 
                //     StudentsTableLocal: Record StudentList;
                begin
                    // StudentsLocal.FindSet(true,true);
                    // repeat
                    //     StudentsTableLocal.Init();
                    //     StudentsTableLocal.Name:=
                    // until Rec.Next(1) = 0;
                    Message('Customer Copy');
                end;
            }
        }

    }
}
