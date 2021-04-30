# Load system config
for config_file (/etc/zsh/custom/*.zsh(N)); do
  custom_config_file="/etc/zsh/custom/${config_file:t}"
  [ -f "${custom_config_file}" ] && config_file=${custom_config_file}
  source $config_file
done

# Load user configs
for config_file ($HOME/.config/zsh/*.zsh(N)); do
  custom_config_file="$HOME/.config/zsh/${config_file:t}"
  [ -f "${custom_config_file}" ] && config_file=${custom_config_file}
  source $config_file
done
