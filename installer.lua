if switchcraft then
  print("Running on switchcraft, using gitget.")
  shell.run("gitget","knijn","osmium","main")
  fs.delete("installer.lua")
  fs.delete("README.md")
  print("Installed Osmium, rebooting now")
else
  shell.run("wget https://github.com/knijn/osmium/blob/main/os.lua os.lua")
  shell.run("wget https://github.com/knijn/osmium/blob/main/home.lua home.lua")
  shell.run("wget https://github.com/knijn/osmium/blob/main/startup.lua startup.lua")
  print("Installed Osmium, rebooting now")
end
sleep(1)
os.reboot()
