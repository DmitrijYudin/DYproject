/// <summary>
/// Page Students (ID 50300).
/// </summary>
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

}
