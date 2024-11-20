object DMMain: TDMMain
  Height = 480
  Width = 640
  object Connection: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Test\Desktop\Datenbanken\db\northwind.sqlite'
      'LockingMode=Normal'
      'DriverID=SQLite')
    ConnectedStoredUsage = []
    LoginPrompt = False
    BeforeConnect = ConnectionBeforeConnect
    Left = 64
    Top = 48
  end
  object QOrders: TFDQuery
    Connection = Connection
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'select *'
      'from Orders'
      'order by OrderDate desc')
    Left = 152
    Top = 48
    object QOrdersOrderID: TFDAutoIncField
      FieldName = 'OrderID'
      ReadOnly = False
    end
    object QOrdersCustomerID: TWideMemoField
      FieldName = 'CustomerID'
      BlobType = ftWideMemo
    end
    object QOrdersEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
    end
    object QOrdersOrderDate: TDateTimeField
      FieldName = 'OrderDate'
    end
    object QOrdersRequiredDate: TDateTimeField
      FieldName = 'RequiredDate'
    end
    object QOrdersShippedDate: TDateTimeField
      FieldName = 'ShippedDate'
    end
    object QOrdersShipVia: TIntegerField
      FieldName = 'ShipVia'
    end
    object QOrdersFreight: TLargeintField
      FieldName = 'Freight'
    end
    object QOrdersShipName: TWideMemoField
      FieldName = 'ShipName'
      BlobType = ftWideMemo
    end
    object QOrdersShipAddress: TWideMemoField
      FieldName = 'ShipAddress'
      BlobType = ftWideMemo
    end
    object QOrdersShipCity: TWideMemoField
      FieldName = 'ShipCity'
      BlobType = ftWideMemo
    end
    object QOrdersShipRegion: TWideMemoField
      FieldName = 'ShipRegion'
      BlobType = ftWideMemo
    end
    object QOrdersShipPostalCode: TWideMemoField
      FieldName = 'ShipPostalCode'
      BlobType = ftWideMemo
    end
    object QOrdersShipCountry: TWideMemoField
      FieldName = 'ShipCountry'
      BlobType = ftWideMemo
    end
  end
end
