function install_mas_apps() {
    echo -n "Install mac app store apps"

    echo -n "Installing Amphetamine"
    mas install 937984704

    echo -n "Installing 1Blocker"
    mas install 1365531024

    echo -n "Installing FB Messenger"
    mas install 1480068668

    # echo -n "Installing Todoist"
    # mas install 585829637

    # echo -n "Install DuckDuckGo Privacy Essentials (trackers)"
    # mas install 1482920575

    # echo -n "Install Craft Docs"
    # mas install 1487937127
}

install_mas_apps
