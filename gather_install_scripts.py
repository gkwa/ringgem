import re
import pathlib
import ruamel.yaml


def process_install_script(file_path, apps):
    app_name = None

    match = re.search(r"install-(.+?)-on-", file_path.name)
    if match:
        app_name = match.group(1)
    else:
        app_name = file_path.stem

    install_method = None
    if "curl" in file_path.name:
        install_method = "curl"
    elif "apt" in file_path.name:
        install_method = "apt"
    elif "yum" in file_path.name:
        install_method = "yum"
    else:
        install_method = "other"

    script_content = file_path.read_text()
    script_content = ruamel.yaml.scalarstring.PreservedScalarString(script_content)

    app_exists = False
    for app in apps:
        if app["name"] == app_name:
            app_exists = True
            method_exists = False
            for method in app["install_methods"]:
                if method["type"] == install_method:
                    method_exists = True
                    break
            if not method_exists:
                app["install_methods"].append(
                    {
                        "type": install_method,
                        "script": script_content,
                        "basename": file_path.name,
                    }
                )
            break

    if not app_exists:
        apps.append(
            {
                "name": app_name,
                "install_methods": [
                    {
                        "type": install_method,
                        "script": script_content,
                        "basename": file_path.name,
                    }
                ],
            }
        )


apps = []
current_dir = pathlib.Path(".")
for file_path in current_dir.glob("install-*.sh"):
    process_install_script(file_path, apps)
for file_path in current_dir.glob("*.html"):
    process_install_script(file_path, apps)
for file_path in current_dir.glob("*.ps1"):
    process_install_script(file_path, apps)

output_file = "scripts.yaml"
yaml = ruamel.yaml.YAML()
with open(output_file, "w") as file:
    yaml.dump({"apps": apps}, file)

print(f"Install scripts gathered and saved to {output_file}")
