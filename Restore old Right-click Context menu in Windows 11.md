## Restore old Right-click Context menu in Windows 11

Starting with Windows 11, the context menu in File Explorer is refreshed, offering a compact design based on modern principles. However, the refreshed context menu shows fewer items compared to the Legacy Context menu. This article discusses how to restore the Legacy Context menu in Windows 11, which shows up by default.

![Recycle bin modern context menu](https://learn-attachment.microsoft.com/api/attachments/55929c97-944a-4fec-9c54-9ab8f185c9d0?platform=QnA)

You can display the Legacy Right-Click Context menu by clicking "Show more options" at the end of the list or pressing Shift+F10. If you want it to be the default, you need to add a registry entry below so that every time you right-click a File or Folder, it shows the Legacy Context menu by default.

![Recycle bin modern context menu](https://learn-attachment.microsoft.com/api/attachments/21379809-4352-4fea-a6f4-0cd0e8f7307d?platform=QnA)

## Restore the old Context Menu in Windows 11

- Right-click the Start button and choose Windows Terminal.
- Copy the command from below, paste it into the Windows Terminal Window, and press Enter.
```
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
```

- Restart File Explorer or your computer for the changes to take effect. You would see the Legacy Right Click Context menu by default.

![Recycle bin modern context menu](https://learn-attachment.microsoft.com/api/attachments/eb66257a-5a8d-4efe-a1e7-d3e6e92ee917?platform=QnA)

- The Registry change masks the new COM object that executes the compact menus with the "Show more options" entry. Once you get this performed, Explorer reverts to the Legacy context menu. 
 
## Restore Modern Context menus in Windows 11

- To undo this change, in a Terminal Window, execute this command:
```
reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
```

- Restart the File Explorer or Computer for the changes to take effect.
- These steps can help you to enable the old context menu in Windows 11. 
