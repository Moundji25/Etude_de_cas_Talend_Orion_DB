# schedule_talend_job.ps1

# Variables
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File Main_Job\`Main_Job_run.ps1`\"
$trigger = New-ScheduledTaskTrigger -Daily -At 11:06PM
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable

# Register the task
Register-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -Settings $settings -TaskName "TalendJob" -Description "Exécute le job Talend quotidiennement à 23H"
