# Docked Windows Demo

Dieses Demo zeigt, wie man unter Delphi/VCL eine moderne Oberfläche mit
**andockbaren Werkzeug-Fenstern** baut – als Alternative zum klassischen,
mittlerweile in die Jahre gekommenen **MDI-Paradigma** (Multiple Document
Interface).

Das Projekt enthält bewusst keine Datenbank, keine Logik, keine Zusatz-
Komponenten. Es geht ausschließlich darum, das Docking-Konzept der VCL
verständlich vorzuführen.

---

## Warum kein MDI mehr?

MDI – also `FormStyle = fsMDIForm` mit `fsMDIChild`-Fenstern in einer
gemeinsamen Eltern-Client-Area – stammt aus den frühen 1990ern und gilt
heute aus mehreren Gründen als problematisch:

- **Microsoft selbst hat MDI faktisch begraben.** Schon in den
  Windows-User-Experience-Guidelines wurde von MDI abgeraten; moderne
  Office- und IDE-Oberflächen nutzen seit Langem Tab-Dokumente,
  Tool-Windows und Docking statt MDI-Childs.
- **Fenster im Fenster** ist für Anwender unübersichtlich: ein MDI-Child
  kann nicht über die Hauptfenster-Grenze hinaus, lässt sich nicht auf
  einen zweiten Monitor ziehen und konkurriert mit der Taskleiste.
- **Multi-Monitor-Setups** sind heute der Normalfall. MDI bricht hier
  konzeptionell.
- **Hohe DPI / Skalierung** und moderne Themes vertragen sich mit dem
  Mini-Desktop-im-Fenster eher schlecht.
- **Barrierefreiheit, Touch und Tastaturnavigation** sind in MDI
  schwächer als bei eigenständigen Top-Level-Fenstern.
- **VCL-Pflege:** Rund um MDI passiert seit vielen Releases praktisch
  nichts mehr; das Docking-Framework wird hingegen weiter genutzt
  (u. a. in der Delphi-IDE selbst).

Kurz: Wer heute eine neue VCL-Anwendung beginnt, sollte **nicht** mit
`fsMDIForm` starten. Das tatsächliche Bedürfnis – mehrere Werkzeug- und
Dokumentenansichten in einem Hauptfenster – löst man besser mit
**Docking** und ggf. **Tab-Dokumenten** (`TPageControl`).

---

## Das Konzept: Dock-Site + dockbares Fenster

Die VCL bringt ein vollständiges Docking-Framework mit Bordmitteln mit.
Es besteht im Kern aus zwei Rollen:

### 1. Dock-Site (das Ziel)

Ein **Dock-Site** ist ein Container, in den Fenster aufgenommen werden
können. Praktisch jeder `TWinControl`-Nachfahre kann eine Dock-Site
sein. Im Demo nutzen wir `TPanel` mit:

| Property            | Wert    | Bedeutung                                                   |
| ------------------- | ------- | ----------------------------------------------------------- |
| `DockSite`          | `True`  | Das Panel darf andockende Fenster aufnehmen.                |
| `UseDockManager`    | `True`  | Mehrere angedockte Fenster werden vom DockManager verwaltet (Stapeln, Tabs, Splitter dazwischen). |
| `Align`             | `alLeft` / `alRight` / `alBottom` | Position der Dock-Zone im Hauptfenster. |

Dazu kommt jeweils ein `TSplitter`, damit der Anwender die Dock-Zonen
zur Laufzeit frei vergrößern und verkleinern kann.

### 2. Dockable Form (das andockende Fenster)

Ein **dockbares Fenster** ist eine ganz normale `TForm`. Es wird zum
Docking-Kandidaten allein durch zwei Properties:

| Property    | Wert            | Bedeutung                                                                 |
| ----------- | --------------- | ------------------------------------------------------------------------- |
| `DragKind`  | `dkDock`        | Beim Ziehen an der Titelleiste startet kein normales Verschieben, sondern eine Dock-Operation. |
| `DragMode`  | `dmAutomatic`   | Die VCL übernimmt das Drag&Drop-Handling automatisch – kein Code nötig. |

Damit lässt sich das Fenster:

- aus seiner aktuellen Dock-Site **herausziehen** → es schwebt frei
  (Floating Window),
- auf eine andere Dock-Site ziehen → es **dockt dort an**,
- auf ein bereits angedocktes Fenster ziehen → es wird **gestapelt**
  (Tab-Docking, dank `UseDockManager`),
- per Code mit `ManualDock(Ziel, nil, alClient)` programmatisch
  irgendwohin platzieren.

### Floating vs. Docked

- **Docked:** Das Fenster sitzt in einer Dock-Site, hat keine eigene
  Caption-Bar im klassischen Sinn mehr und teilt sich den Platz mit der
  Site.
- **Floating:** Das Fenster schwebt als eigenständiges Top-Level-Fenster
  über dem Bildschirm, lässt sich auf einen zweiten Monitor verschieben,
  hat eigene Taskbar-Repräsentation – also genau das, was MDI nicht
  konnte.

`HostDockSite` ist die zentrale Property, um zu unterscheiden:
`nil` ⇒ floating, sonst ⇒ angedockt.

---

## Aufbau des Demos

```
DockedWindows/
├── DockedWindows.dpr                  Programmstart, erzeugt vier Forms
├── DockedWindows.dproj                VCL-Projekt (Win32)
├── DockedWindows.Main.Form.pas/.dfm   Hauptfenster, enthält die Dock-Sites
├── DockedWindows.Toolbox.Form.pas/.dfm    dockbares Werkzeug-Fenster
├── DockedWindows.Properties.Form.pas/.dfm dockbares Eigenschafts-Fenster
└── DockedWindows.Log.Form.pas/.dfm        dockbares Log-Fenster
```

### Hauptfenster (`TFormMain`)

Layout (alles auf einer einzigen, normalen `TForm` – kein MDI):

```
+-----------------------------------------------------------+
| MainMenu / ToolBar                                        |
+----------+----------------------------------+-------------+
|          |                                  |             |
|  Panel   |          Panel                   |   Panel     |
|  Left    |          Center                  |   Right     |
|  (Dock)  |        (Workspace)               |   (Dock)    |
|          |                                  |             |
|          |                                  |             |
+----------+----------------------------------+-------------+
|                  Panel Bottom (Dock)                      |
+-----------------------------------------------------------+
|                       StatusBar                           |
+-----------------------------------------------------------+
```

- `PanelLeft`, `PanelRight`, `PanelBottom` sind Dock-Sites.
- `PanelCenter` (`Align = alClient`) ist die zentrale Arbeitsfläche.
- Zwischen den Zonen sitzen `TSplitter`-Komponenten.

### Die drei dockbaren Fenster

Jedes Tool-Fenster (`TFormToolbox`, `TFormProperties`, `TFormLog`) ist
eine simple `TForm` mit `DragKind = dkDock` und `DragMode = dmAutomatic`.
Im `OnClose`-Handler steht jeweils nur:

```pascal
procedure TFormToolbox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;     // schliessen = ausblenden, nicht freigeben
end;
```

So bleibt der Zustand erhalten und das Menü „Ansicht“ kann das Fenster
einfach wieder einblenden.

### Initiales Layout

Im `OnCreate` des Hauptfensters werden die Tool-Fenster per Code an
ihren Startplatz gedockt:

```pascal
procedure TFormMain.ShowToolForm(AForm: TForm; ADockTarget: TWinControl);
begin
  if AForm.HostDockSite <> nil then
    AForm.ManualDock(nil, nil, alNone);          // ggf. erst loesen
  AForm.ManualDock(ADockTarget, nil, alClient);  // an Ziel-Panel docken
  AForm.Show;
end;
```

Das Menü „Ansicht → Layout zurücksetzen“ ruft genau diese Routine
erneut auf und stellt damit den Auslieferungszustand wieder her.

---

## Was es zu testen gibt

1. **Andocken / Abdocken:** Titelleiste eines Werkzeug-Fensters greifen
   und herausziehen → das Fenster schwebt frei. Wieder auf ein
   Dock-Panel ziehen → es dockt dort an.
2. **Stapeln (Tab-Docking):** Ein schwebendes Fenster auf ein bereits
   angedocktes Fenster ziehen. Die VCL legt automatisch Tabs an
   (Voraussetzung: `UseDockManager = True`).
3. **Größen ändern:** Dock-Zonen mit den Splittern verkleinern und
   vergrößern.
4. **Schließen / Wieder anzeigen:** Werkzeug-Fenster schließen, danach
   über Menü „Ansicht“ oder die Toolbar wieder einblenden.
5. **Layout zurücksetzen:** Menü „Ansicht → Layout zurücksetzen“ stellt
   die Ausgangsanordnung wieder her.
6. **Multi-Monitor:** Ein abgedocktes Fenster lässt sich problemlos auf
   einen zweiten Monitor ziehen – etwas, das MDI grundsätzlich nicht
   konnte.

---

## Was hier bewusst weggelassen wurde

- **Layout-Persistenz:** Die VCL erlaubt das Speichern und Laden des
  Dock-Zustands (`TDockTree.SaveToStream` / `LoadFromStream` bzw.
  eigene Lösung über `HostDockSite`, `DockOrientation` …). Für ein
  Einstiegsdemo macht das den Code unnötig schwer – das wäre ein
  natürlicher nächster Schritt.
- **Custom Dock-Manager:** Eigener Look & Feel beim Andocken (Pfeile,
  Vorschau-Rechteck wie in der Delphi-IDE) wird nicht implementiert.
- **Tab-Dokumente in der Mitte:** Die zentrale Arbeitsfläche ist hier
  ein einfaches `TMemo`. In einer echten Anwendung würde dort meist ein
  `TPageControl` mit Tabs sitzen – das ist die saubere Antwort auf
  „mehrere offene Dokumente“ (statt MDI-Childs).

---

## Kurz-Glossar

| Begriff             | Bedeutung                                                                 |
| ------------------- | ------------------------------------------------------------------------- |
| MDI                 | Multiple Document Interface – Kind-Fenster innerhalb eines Eltern-Fensters. Veraltet. |
| Dock-Site           | Container, der andockende Fenster aufnehmen kann (`DockSite = True`).     |
| Dockable Form       | Fenster, das per Drag&Drop andocken kann (`DragKind = dkDock`).           |
| Floating            | Das Fenster ist nicht angedockt, sondern schwebt eigenständig.            |
| Host Dock Site      | Aktuelle Dock-Site eines Fensters; `nil` wenn floating.                   |
| Dock Manager        | Verwaltet mehrere angedockte Kinder einer Dock-Site (Splitter, Tabs).     |
