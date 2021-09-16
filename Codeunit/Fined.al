/// <summary>
/// Codeunit Fined The Right Way (ID 50300).
/// </summary>
codeunit 50300 "Fined The Right Way"
{
    /// <summary>
    /// FinedTest.
    /// </summary>
    procedure FinedTest()
    var 
        CustomerVar: Record Customer;
    begin
        CustomerVar.Find()
    end;
}