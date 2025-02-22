unit SimplePlugin.Example;

interface
uses
  System.SysUtils,
  ToolsAPI, // Open Tools API
  Vcl.Menus,
  Vcl.Dialogs;


procedure Register;

implementation

type
  TSimplePlugin = class(TInterfacedObject, IOTAWizard, IOTANotifier)
  private
    FMenuItem: TMenuItem;
    procedure MenuClick(Sender: TObject);
  public
    // IOTAWizard methods
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    // IOTANotifier methods
    procedure AfterSave;
    procedure BeforeSave;
    procedure Destroyed;
    procedure Modified;
    // Lifecycle methods
    constructor Create;
    destructor Destroy; override;
  end;

{ TSimplePlugin }

constructor TSimplePlugin.Create;
var
  NTAServices: INTAServices;
begin
  inherited Create;
  // Get the IDE's main services
  if Supports(BorlandIDEServices, INTAServices, NTAServices) then
  begin
    // Create a new menu item under the Tools menu
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
  Result := 'SimplePluginWizard'; // Unique identifier for the plugin
end;

function TSimplePlugin.GetName: string;
begin
  Result := 'Simple Plugin'; // Display name in the IDE
end;

function TSimplePlugin.GetState: TWizardState;
begin
  Result := [wsEnabled]; // Plugin is always enabled
end;

procedure TSimplePlugin.MenuClick(Sender: TObject);
begin
  ShowMessage('You clicked the Simple Plugin menu item!');
end;

// IOTANotifier implementations (empty for this simple example)
procedure TSimplePlugin.AfterSave;
begin
  // No action needed
end;

procedure TSimplePlugin.BeforeSave;
begin
  // No action needed
end;

procedure TSimplePlugin.Destroyed;
begin
  // No action needed
end;

procedure TSimplePlugin.Modified;
begin
  // No action needed
end;

procedure Register;
begin
  RegisterPackageWizard(TSimplePlugin.Create);
end;

end.
