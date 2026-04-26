# UDP

A small VCL demo for local UDP communication with Indy. It consists of two programs: a sender and a receiver. The server sends text via UDP to `127.0.0.1:7777`; the client binds locally to port `7777` and waits for a packet.

## What It Shows

UDP is connectionless: there is no connection handshake like TCP, no delivery guarantee, and no built-in ordering. That makes it a useful learning example because the responsibilities of the components are very visible:

- `TIdUDPServer.SendBuffer` sends a byte array.
- `TIdUDPClient.ReceiveBuffer` waits for incoming bytes.
- Text is explicitly encoded as UTF-8 and decoded again.
- Port `7777` is configured as the client's `BoundPort` and as the server's target port.

## Project Layout

```text
UDP/
├── UDPDemo.groupproj
├── UDPServer.dpr/.dproj
├── UDPServer.Main.Form.pas/.dfm
├── UDPClient.dpr/.dproj
└── UPDClient.Main.Form.pas/.dfm
```

Note: the client unit is historically named `UPDClient.Main.Form.pas` instead of `UDPClient.Main.Form.pas`. It is just a file name, not a separate concept.

## Getting Started

Open `UDPDemo.groupproj` in Delphi, or open the two projects individually:

- `UDPServer.dproj`
- `UDPClient.dproj`

Start the client first and click `receive`. Then start the server, edit the text if you like, and click `Send`.

The sample text intentionally contains umlauts and Hebrew characters. This makes it easy to see whether UTF-8 encoding is handled correctly.

## Interesting Code

- `UDPServer.Main.Form.pas`: `TEncoding.UTF8.GetBytes` and `UDPServer.SendBuffer`.
- `UPDClient.Main.Form.pas`: `UDPClient.Active`, `ReceiveBuffer`, and `TEncoding.UTF8.GetString`.
- `UDPServer.Main.Form.dfm`: `DefaultPort = 7777`.
- `UPDClient.Main.Form.dfm`: `BoundIP = '127.0.0.1'` and `BoundPort = 7777`.

## Things To Try

1. Start the server before the client is waiting: the packet is lost. That is UDP in its pure form.
2. Change `127.0.0.1` to another local IP on your network.
3. Send longer text and observe the buffer size in the client.
4. Add a timer that sends packets regularly.
5. Show the sender address and a timestamp in the memo.

## Requirements

- Delphi/RAD Studio for Windows.
- Indy components, which are usually included with Delphi.

No additional infrastructure is needed for tests on the same machine. Firewall rules may matter when testing across the network.
