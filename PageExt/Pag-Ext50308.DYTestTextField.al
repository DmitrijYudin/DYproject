pageextension 50308 DYTestTextField extends "Sales Invoice"
{

    layout
    {
        addfirst(General)
        {
            field("DYTestTextField"; Rec.DYTestTextFiel)
            {
                Visible = true;
                ApplicationArea = all;
            }
        }
    }
}