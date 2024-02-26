# Project Setup Script Documentation

## Overview

The Project Setup Script is a bash script designed to streamline the setup process for new projects or penetration testing engagements. It automates the creation of project directories, exports essential environment variables, and performs other repetitive tasks, reducing manual effort and potential errors.

## Features
Automated Directory Creation: The script automatically creates project folders, including directories for storing enumeration results, loot, privilege escalation findings, and exploits.

Environment Variable Management: It exports crucial environment variables such as IP addresses, URLs, and port numbers, making them available throughout the session and eliminating the need for manual entry.

Integration with /etc/hosts: Optionally, the script can add entries to the /etc/hosts file to associate IP addresses with project names, simplifying network reconnaissance and enumeration tasks.

Interactive Setup: The script offers an interactive mode where users are guided through the setup process step by step, providing inputs as needed.

Error Handling: Robust error handling ensures graceful handling of unexpected situations, such as network interface detection failures or directory creation errors.

The Common_Commands repository leverages this setup, employing a standardized folder structure and environment variables. This framework streamlines the integration of scripts and commands, reducing the necessity for manual alterations or adjustments upon completing the setup.

## Usage
Setup: Run the script using source or ./ to execute in the current shell environment.
```
./project_setup.sh
```
Follow Prompts: The script will prompt you for the project name, target IP address, desired LPORT, and other configuration details. Enter the requested information as prompted.

Review Results: After setup is complete, review the results displayed by the script, including environment variable settings, directory creation status, and any additional instructions.

## Examples

#### Basic Usage
```
$ source project_setup.sh
$ Enter Project Name: example_project
$ Enter target IP address: 192.168.1.10
$ Enter Desired LPORT: 4444
$ Do you want to add an entry to /etc/hosts for 192.168.1.10 example_project? [Y/N]: Y
$ Please enter your sudo password to adjust hosts.
```

## Troubleshooting

If you encounter any issues or errors during setup, refer to the following troubleshooting tips:

Ensure that you have the necessary permissions to execute the script and modify system files such as /etc/hosts.
Double-check your inputs for correctness, especially IP addresses and port numbers.
Review the script's output and any error messages displayed to identify the cause of the issue.
If problems persist, consult the script's documentation or seek assistance from the project maintainer.
Contributing
Contributions to the Project Setup Script are welcome! If you have ideas for new features, improvements, or bug fixes, please submit a pull request or open an issue on the project's GitHub repository.

## Contributing
Contributions to the Project Setup Script are welcome! If you have ideas for new features, improvements, or bug fixes, please submit a pull request or open an issue on the project's GitHub repository.

## License
This script is released under the MIT License. See the LICENSE file for details.
