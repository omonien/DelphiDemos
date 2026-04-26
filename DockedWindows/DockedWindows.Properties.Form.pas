unit DockedWindows.Properties.Form;

// Tool window with a small object-inspector style grid. Dockable just like
// FormToolbox - the magic is purely in DragKind / DragMode (.dfm).

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids;

type
  TFormProperties = class(TForm)
    Header: TPanel;
    Grid: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  FormProperties: TFormProperties;

implementation

{$R *.dfm}

procedure TFormProperties.FormCreate(Sender: TObject);
begin
  Grid.ColCount  := 2;
  Grid.RowCount  := 7;
  Grid.FixedRows := 1;
  Grid.FixedCols := 0;

  Grid.Cells[0, 0] := 'Property';
  Grid.Cells[1, 0] := 'Value';

  Grid.Cells[0, 1] := 'Name';        Grid.Cells[1, 1] := 'FormMain';
  Grid.Cells[0, 2] := 'Caption';     Grid.Cells[1, 2] := 'Docked Windows Demo';
  Grid.Cells[0, 3] := 'Width';       Grid.Cells[1, 3] := '1080';
  Grid.Cells[0, 4] := 'Height';      Grid.Cells[1, 4] := '640';
  Grid.Cells[0, 5] := 'DockSite';    Grid.Cells[1, 5] := 'True (panels)';
  Grid.Cells[0, 6] := 'BorderStyle'; Grid.Cells[1, 6] := 'bsSizeable';

  Grid.ColWidths[0] := 110;
  Grid.ColWidths[1] := 140;
end;

procedure TFormProperties.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

end.
