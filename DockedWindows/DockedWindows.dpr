/// <summary>
/// DockedWindows
/// Starts the docked windows VCL demo application.
/// </summary>
///
/// <remarks>
/// Creates the main form and its dockable tool windows so the VCL docking
/// framework can arrange them at startup.
/// </remarks>
///
/// <copyright>
/// Copyright © 2026 Olaf Monien
/// Licensed under MIT
/// </copyright>

program DockedWindows;

uses
  Vcl.Forms,
  DockedWindows.Main.Form in 'DockedWindows.Main.Form.pas' {FormMain},
  DockedWindows.Toolbox.Form in 'DockedWindows.Toolbox.Form.pas' {FormToolbox},
  DockedWindows.Properties.Form in 'DockedWindows.Properties.Form.pas' {FormProperties},
  DockedWindows.Log.Form in 'DockedWindows.Log.Form.pas' {FormLog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Docked Windows Demo';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormToolbox, FormToolbox);
  Application.CreateForm(TFormProperties, FormProperties);
  Application.CreateForm(TFormLog, FormLog);
  Application.Run;
end.
