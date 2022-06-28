add-content -path 'c:/users/Mitchell Privett/.ssh/config' -value @'

Host ${hostname}
  HostName ${hostname}
  User ${user}
  IdentityFile ${identityfile}
'@