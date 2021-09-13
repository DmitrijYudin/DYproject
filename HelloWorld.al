// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

/// <summary>
/// PageExtension CustomerListExt (ID 50100) extends Record Customer List.
/// </summary>
pageextension 50300 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('Customer list');
    end;
}