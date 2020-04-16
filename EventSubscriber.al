codeunit 50112 MySubscriberCodeunitMx
{
    trigger OnRun()
    begin

    end;

    /*
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostCommitSalesDoc', '', true, true)]
    local procedure MyProcedureInvA(SalesHeader: Record "Sales Header"
    //var SalesInvoiceHeader: Record "Sales Invoice Header"
    //var SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    //var SkipDelete: Boolean
    )
    var

        lcSHRecRef: RecordRef;
        lcSH: Record "Sales Header";
    begin
        // //
        // //
        //OnBeforeDeleteAfterPosting
        //OnRunOnBeforeFinalizePosting

        //OnAfterPostSalesDoc
        //OnAfterFinalizePosting

        //OnAfterDeleteAfterPosting() -> SalesHeader does not exist -> Gone (Posted)
        //OnAfterFinalizePostingOnBeforeCommit() -> SalesHeader does not exist
        //OnBeforeFinalizePosting()
        //OnAfterSalesInvHeaderInsert()

        //OnAfterUpdatePostingNos(SalesHeader, NoSeriesMgt, SuppressCommit);
        //OnInsertPostedHeadersOnBeforeInsertInvoiceHeader(SalesHeader, IsHandled);
        //OnAfterUpdatePostingNos -> changes on sales header cannot be saved

        // ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnFinalizePosting',
        //'ElementName', SkipOnMissingLicense, SkipOnMissingPermission
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice THEN begin
            //Clear(varRpt50102mx);
            //varRpt50102mx.SetShNo(SalesHeader."No.");
            //varRpt50102mx.UseRequestPage := FALSE;
            //varRpt50102mx.RunModal();
            
            Clear(lcSHRecRef);
            lcSHRecRef.Open(DATABASE::"Sales Header");
            if lcSH.Get(lcSH."Document Type"::Invoice, SalesHeader."No.") then
                lcSHRecRef.GetTable(lcSH);
            ERROR('');

            //ERROR('Error01 Inv');
        end;
        //ERROR('No registro de Documento:%1 %2', SalesHeader."No.", SalesInvoiceHeader."No.");
        //OnAfterDeleteAfterPosting
    end;
    */


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterReleaseSalesDoc', '', true, true)]
    local procedure MyProcedureInv1(SalesHeader: Record "Sales Header"
    //var SalesInvoiceHeader: Record "Sales Invoice Header"
    //var SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    //var SkipDelete: Boolean
    )
    var
        lcSHRecRef: RecordRef;
        lcSH: Record "Sales Header";
    begin
        // //
        // //
        //OnBeforeDeleteAfterPosting
        //OnRunOnBeforeFinalizePosting

        //OnAfterPostSalesDoc
        //OnAfterFinalizePosting

        //OnAfterDeleteAfterPosting() -> SalesHeader does not exist -> Gone (Posted)
        //OnAfterFinalizePostingOnBeforeCommit() -> SalesHeader does not exist
        //OnBeforeFinalizePosting()
        //OnAfterSalesInvHeaderInsert()

        //OnAfterUpdatePostingNos(SalesHeader, NoSeriesMgt, SuppressCommit);
        //OnInsertPostedHeadersOnBeforeInsertInvoiceHeader(SalesHeader, IsHandled);
        //OnAfterUpdatePostingNos -> changes on sales header cannot be saved

        // ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnFinalizePosting',
        //'ElementName', SkipOnMissingLicense, SkipOnMissingPermission
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice THEN begin

            Clear(lcSHRecRef);
            lcSHRecRef.Open(DATABASE::"Sales Header");
            if lcSH.Get(lcSH."Document Type"::Invoice, SalesHeader."No.") then
                lcSHRecRef.GetTable(lcSH);

            Message('OnAfterReleaseSalesDoc,');
        end;
        //ERROR('No registro de Documento:%1 %2', SalesHeader."No.", SalesInvoiceHeader."No.");
        //OnAfterDeleteAfterPosting
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeDeleteAfterPosting', '', true, true)]
    local procedure MyProcedureInv2(SalesHeader: Record "Sales Header"
    //SalesInvoiceHeader: Record "Sales Invoice Header"
    )
    var

    begin
        //OnBeforeDeleteAfterPosting
        //OnAfterDeleteAfterPosting

        //OnAfterPostSalesDoc
        //OnRunOnBeforeFinalizePosting()
        //OnAfterDeleteAfterPosting() -> SalesHeader does not exist -> Gone (Posted)
        //OnAfterFinalizePostingOnBeforeCommit() -> SalesHeader does not exist
        //OnAfterFinalizePosting ->
        //OnBeforeFinalizePosting() -> SalesHeader."Folio Fiscal" empty.
        //OnAfterSalesInvHeaderInsert()
        //OnAfterUpdatePostingNos(SalesHeader, NoSeriesMgt, SuppressCommit);

        //OnFinalizePostingOnBeforeCreateOutboxSalesTrans -> Gone(Posted)

        // ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnFinalizePosting',
        //'ElementName', SkipOnMissingLicense, SkipOnMissingPermission
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice THEN begin
            //Clear(varRpt50102mx);
            //varRpt50102mx.SetInvNo(SalesInvoiceHeader."No.");
            //varRpt50102mx.UseRequestPage := FALSE;
            //varRpt50102mx.RunModal();

            //Message('SH.FF:%1', SalesHeader."Folio Fiscal");
            Message('OnBeforeDeleteAfterPosting,');
        end;
        //ERROR('No registro de Documento:%1 %2', SalesHeader."No.", SalesInvoiceHeader."No.");
        //OnAfterDeleteAfterPosting
        //ERROR('Error02.2 Inv');
    end;

    /*
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeDeleteAfterPosting', '', true, true)]
    local procedure MyProcedureCrM(var SalesHeader: Record "Sales Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    var
        varRpt50102mx: Report Rpt50102mx;
    begin
        //OnBeforeDeleteAfterPosting
        //OnAfterFinalizePostingOnBeforeCommit
        //OnRunOnBeforeFinalizePosting
        //OnAfterUpdatePostingNos(SalesHeader, NoSeriesMgt, SuppressCommit);

        // ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnFinalizePosting',
        //'ElementName', SkipOnMissingLicense, SkipOnMissingPermission
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::"Credit Memo" THEN begin
            ERROR('Error00 CrM');
            Clear(varRpt50102mx);
            varRpt50102mx.SetCrMNo(SalesCrMemoHeader."No.");
            varRpt50102mx.UseRequestPage := FALSE;
            varRpt50102mx.RunModal();
        END;

        //OnAfterDeleteAfterPosting
    end;
    */
}