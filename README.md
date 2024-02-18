# SMB URI Handler

This repository contains scripts for handling SMB (Server Message Block) URIs on both Windows and Linux environments. The scripts provide functionality to open SMB URIs in file explorers and copy Windows file paths as SMB URIs for directories and files.

## Features

- **Windows Integration:**
  - Seamlessly open SMB URIs in Windows Explorer by clicking on links in supported applications like Firefox.

- **Linux Integration:**
  - Easily handle SMB URIs in GNOME on Linux with Nautilus.

- **Effortless SMB URI Copying:**
  - Simplify sharing and referencing files in a networked environment.
  - Context menu options for Windows Explorer to copy Windows file paths as SMB URIs for directories and files.

## Usage

### Windows

1. **Installation:**
   - Run the `install.bat` script in the `windows` directory to set up the necessary registry entries.

2. **Open SMB URIs:**
   - Click on an SMB link in Firefox to open it in Windows Explorer.

3. **Copy Windows Paths as SMB URIs:**
   - Right-click on a directory or file.
   - Choose "Copy URI" from the context menu.

### Linux

1. **Installation:**
   - Run the `install.sh` script in the `linux` directory to create the necessary desktop entry for GNOME.

2. **Open SMB URIs:**
   - Click on an SMB link in a supported application to open it in Nautilus.


## Directory Structure

- **`windows` folder:**
  - `install.bat`: Script for Windows to register SMB URIs and set up context menu options.
  - `scripts` folder:
    - `openSmbLink.bat`: Script to open SMB URIs in Windows Explorer.
    - `WinToSmb.bat`: Script to copy Windows file paths as SMB URIs for directories and files.

- **`linux` folder:**
  - `install.sh`: Script for Linux to register SMB URIs with Nautilus.

## License

This project is licensed under the [MIT License](LICENSE).

## Contribution

Feel free to contribute by opening issues or creating pull requests.

## Disclaimer

Use these scripts at your own risk. Carefully read and understand the scripts before executing them.

## Sources

- [Super User - Opening SMB links on Windows](https://superuser.com/questions/1064142/opening-smb-links-on-windows)
- [wjd.nu - Opening SMB Files Using Opera](https://wjd.nu/articles/2004/00/opening_smb_files_using_opera)
- [Stack Overflow - Copy text from a Windows CMD window to clipboard](https://stackoverflow.com/questions/11543578/copy-text-from-a-windows-cmd-window-to-clipboard)

---

**Note:** These scripts are designed to work on Windows and Linux systems and assume a basic understanding of scripting and system configurations. Use them responsibly and make sure to back up your system before making changes.

**ChatGPT:** Special thanks to ChatGPT, an OpenAI language model, for assistance in crafting this README and providing information.

