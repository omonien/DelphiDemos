/// <summary>
/// SimplePlugin.Example
/// Minimal Delphi IDE plugin using the Open Tools API.
/// </summary>
///
/// <remarks>
/// Registers an IDE wizard and adds a simple command to the Tools menu.
/// </remarks>
///
/// <copyright>
/// Copyright © 2026 Olaf Monien
/// Licensed under MIT
/// </copyright>

unit SimplePlugin.Example;

interface
uses
  System.SysUtils,
  ToolsAPI,
  Vcl.Menus,
  Vcl.Dialogs;


procedure Register;

implementation

type
  /// <summary>
  /// Registers a minimal IDE wizard and Tools menu command.
  /// </summary>
  TSimplePlugin = class(TInterfacedObject, IOTAWizard, IOTANotifier)
  private
    FMenuItem: TMenuItem;
    procedure MenuClick(Sender: TObject);
  public
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    procedure AfterSave;
    procedure BeforeSave;
    procedure Destroyed;
    procedure Modified;
    constructor Create;
    destructor Destroy; override;
  end;

{ TSimplePlugin }

constructor TSimplePlugin.Create;
var
  NTAServices: INTAServices;
begin
  inherited Create;
  if Supports(BorlandIDEServices, INTAServices, NTAServices) then
  begin
    FMenuItem := TMenuItem.Create(nil);
    FMenuItem.Caption := 'Show Simple Message';
    FMenuItem.OnClick := MenuClick;
    NTAServices.MainMenu.Items.Find('Tools').Add(FMenuItem);
  end;
end;

destructor TSimplePlugin.Destroy;
begin
  FMenuItem.Free;
  inherited Destroy;
end;

procedure TSimplePlugin.Execute;
begin
  // This is called if the wizard is invoked directly (not used here)
  ShowMessage('Hello from the Simple Plugin!');
end;

function TSimplePlugin.GetIDString: string;
begin
  Result := 'SimplePluginWizard';
end;

function TSimplePlugin.GetName: string;
begin
  Result := 'Simple Plugin';
end;

function TSimplePlugin.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure TSimplePlugin.MenuClick(Sender: TObject);
begin
  ShowMessage('You clicked the Simple Plugin menu item!');
end;

procedure TSimplePlugin.AfterSave;
begin
end;

procedure TSimplePlugin.BeforeSave;
begin
end;

procedure TSimplePlugin.Destroyed;
begin
end;

procedure TSimplePlugin.Modified;
begin
end;

procedure Register;
begin
  RegisterPackageWizard(TSimplePlugin.Create);
end;

end.
