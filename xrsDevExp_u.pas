unit xrsDevExp_u;

interface

// UNITS
uses
//  System.SysUtils,
//  Data.DB,
//  FireDAC.Comp.Client,
//  Vcl.Dialogs,
System.Classes,
dxBar;

// CONST
// RESOURCESTING

// PROCEDURES
  // function x(): Tguid;
  // procedure y();
 procedure CloneItems(ASourceItemLinks, ADestinationItemLinks: TdxBarItemLinks);
implementation

//uses
//  rsResourcestring_u;

procedure CloneItems(ASourceItemLinks, ADestinationItemLinks: TdxBarItemLinks);
var
  I: Integer;
  ASourceItem, ADestinationItem: TdxBarItem;
begin
  for I := ASourceItemLinks.Count - 1 downto 0 do
  begin
    ASourceItem := ASourceItemLinks[I].Item;
    ADestinationItem := ADestinationItemLinks.BarManager.AddItem(TdxBarItemClass(ASourceItem.ClassType));
    ADestinationItem.Assign(ASourceItem);
    ADestinationItemLinks.Insert(0).Item := ADestinationItem;
    if ASourceItem is TdxBarSubItem then
    begin
      CloneItems(TdxBarSubItem(ASourceItem).ItemLinks, TdxBarSubItem(ADestinationItem).ItemLinks);
    end;
  end;
  // INFO ------------------------------------------
  //procedure TForm3.dxBarButton1Click(Sender: TObject);
  //begin
  //  ShowMessage((Sender as TdxBarButton).BarManager.Owner.Name);
  //end;
  //
  //procedure TForm2.FormShow(Sender: TObject);
  //begin
  //  CloneItems(Form3.dxBarManager1Bar1.ItemLinks, dxBarManager1Bar1.ItemLinks);
  //end;
end;

end.
