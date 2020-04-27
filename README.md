1. Make sure you can run scripts on your powershell

          ***easy mode****
 Set-ExecutionPolicy unrestricted (kind of unsafe)

	*** More secure ***
 powershell -ExecutionPolicy ByPass -File GlobalProtect-Start-Stop.ps1

2. Right click script, select run with powershell

3. When you press the stop it button, it will stop everything neccessary to make sure GlobalProtect does not respawn. Check task bar to make sure icon when away.  Sometimes you will have to hover over the icon and it will vanish.  

4.  There is no pop up confirmations, you will see the icon and processes go away.  

5. Enjoy
