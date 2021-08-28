if switchcraft then
  print("Running on switchcraft, using gitget.")
  shell.run("gitget","knijn","osmium","main")
  fs.delete("installer"); fs.delete("README")
else
  print("Geting file 1/3")
  shell.run("wget https://github.com/knijn/osmium/blob/main/os.lua os.lua")
  print("Geting file 2/3")
  shell.run("wget https://github.com/knijn/osmium/blob/main/home.lua home.lua")
  print("Geting file 3/3")
  shell.run("wget https://github.com/knijn/osmium/blob/main/startup.lua startup.lua")
  print("Installed.")
end
os.reboot()
