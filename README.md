I found it hard to believe that you could not easily stop the GlobalProtect process, so I created this quick tool to start and stop it, so it doesn't eat up resources. 

1. Make sure you can run scripts on your powershell

*** Set-ExecutionPolicy unrestricted (kind of unsafe) ***

*** powershell -ExecutionPolicy ByPass -File GlobalProtect-Start-Stop.ps1 (more secure) ***

2. Right click script, select run with powershell

3. When you press the stop it button, it will stop everything neccessary to make sure GlobalProtect does not respawn. Check task bar to make sure icon when away.  Sometimes you will have to hover over the icon and it will vanish.  

4.  There is no pop up confirmations, you will see the icon and processes go away.  

5. Enjoy
