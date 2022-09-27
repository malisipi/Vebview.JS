import uuid
import os

setup_file_template="""
#define MyAppName "{&1}"
#define MyAppVersion "{&2}"
#define MyAppPublisher "{&3}"
#define MyAppURL "{&4}"
#define MyAppExeName "vebview.exe"
#define MyAppAssocName "{&1} File"
#define MyAppAssocExt ".{&5}"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt

[Setup]
;The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
AppId={{{&6}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
ChangesAssociations=yes
DisableProgramGroupPage=yes
{&7}LicenseFile=.\dist\{&8}
{&9}InfoBeforeFile=.\dist\{&10}
{&11}InfoAfterFile=.\dist\{&12}
;The following line to run in non administrative install mode (install for current user only.)
;{&13}PrivilegesRequired=lowest
OutputDir=.
OutputBaseFilename={&1}_setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: ".\dist\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\dist\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

{&14}[Registry]
{&14}Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
{&14}Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
{&14}Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
{&14}Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: \"""{app}\{#MyAppExeName}"" ""%1\"""
{&14}Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: ".{&5}"; ValueData: ""

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
"""
program_guid=str(uuid.uuid4())
answer=input("Program Name          (Program): "); setup_file_template=setup_file_template.replace("{&1}", answer if answer!="" else "Program")
answer=input("Program Version       (1.0.0.0): "); setup_file_template=setup_file_template.replace("{&2}", answer if answer!="" else "1.0.0.0")
answer=input("Publisher Name        (Company): "); setup_file_template=setup_file_template.replace("{&3}", answer if answer!="" else "Company")
answer=input("Program Website       (       ): "); setup_file_template=setup_file_template.replace("{&4}", answer if answer!="" else "")

answer=input("Program Extension     (  txt  ): "); setup_file_template=setup_file_template.replace("{&5}", answer if answer!="" else "")
setup_file_template=setup_file_template.replace("{&14}","" if answer!="" else ";")

answer=input("Program GUID          (.......): "); setup_file_template=setup_file_template.replace("{&6}", answer if answer!="" else program_guid)
program_guid=program_guid if answer=="" else answer
print("\n\n\n        Program GUID (You should save this to regenerate the setup (for e.g. updates) in future):\n           "+program_guid+"\n\n\n")

answer=input("License File Location (./dist/): "); setup_file_template=setup_file_template.replace("{&8}", answer if answer!="" else "")
setup_file_template=setup_file_template.replace("{&7}","" if answer!="" else ";")

answer=input("Info File Location That Shown Before Installation (./dist/): "); setup_file_template=setup_file_template.replace("{&10}", answer if answer!="" else "")
setup_file_template=setup_file_template.replace("{&9}","" if answer!="" else ";")

answer=input("Info File Location That Shown After Installation  (./dist/): "); setup_file_template=setup_file_template.replace("{&12}", answer if answer!="" else "")
setup_file_template=setup_file_template.replace("{&11}","" if answer!="" else ";")

f = open("program_setup.iss", "w")
f.write(setup_file_template)
f.close()

os.system("\"C:\Program Files (x86)\Inno Setup 6\ISCC.exe\" ./program_setup.iss")
input("Press Enter to exit")
