codeunit 50145 "My Install Codeunit"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        myAppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(myAppInfo);

        if myAppInfo.DataVersion = Version.Create(0, 0, 0, 0) then
            HandleFreshInstall
        else
            HandleReinstall;
    end;

    trigger OnInstallAppPerDatabase()
    begin
        Message('App installed');
    end;

    local procedure HandleFreshInstall()
    var
        MySetup: Record "My Setup";
    begin
        if not MySetup.Get() then begin
            MySetup.Init();
            MySetup.Insert();
        end;

        MySetup."Is Installed" := true;
        MySetup.Modify();
    end;

    local procedure HandleReinstall()
    var
        MySetup: Record "My Setup";
    begin
        if not MySetup.Get() then begin
            MySetup.Init();
            MySetup.Insert();
        end;

        MySetup."Is Installed" := false;
        MySetup."Is Reinstalled" := true;
        MySetup.Modify();
    end;
}