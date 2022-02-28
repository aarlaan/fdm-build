@rem The following line is used to send output to the console, one page at a time.
@"%~dp0DeploymentManager.exe" %* | more

@rem Note: An alternate form is provided below which will stream all of the output to the console, without paging.
@rem 
@rem       "%~dp0DeploymentManager.exe" %* | more >CON
@rem

