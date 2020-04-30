Generally, each `<Api>.yaml` file in this directory corresponds to the `<Api>Controller.cs` file in
https://github.com/bitwarden/server/blob/master/src/Api/Controllers.

There are some exceptions, such as `Notifications.yaml`, which covers `PushController.cs`, as well as
the WebSocket notifications provided by [SignalR](https://github.com/SignalR/SignalR).
