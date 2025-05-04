{ config, ... }:
{

  # Set a temp password for use by minimal builds like installer and iso
  users.users.${config.hostSpec.username} = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$KoNEKfrUeX.HITNeGrQst1$J7JfKqilPXeiN6RuMOMK80hPy9aRVxDZ/YgKHrEbtf1";
    extraGroups = [ "wheel" ];
  };
}
